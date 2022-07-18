import 'package:jjc/models/user_model.dart';
import 'package:mobx/mobx.dart';
part 'userStore.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {

  @observable
  userModel user = userModel();

  @observable
  bool logado = false;

  @observable
  String token = '';

  @observable
  List _libCarregada = [];

  @action
  void login(token, String id_user, String email, List myLib, List myLibNogi, List prop_tec, List agrupamento){
    user.id_user = id_user;
    user.email = email;
    user.myLib = myLib;
    user.myLibNogi = myLibNogi;
    user.prop_tec = prop_tec;
    agrupamento.add(email);
    user.agrupamento = agrupamento;

    logado = true;
    this.token = token;

  }

  @action
  void logout(){
    user.id_user = '';
    user.email = 'email';
    user.myLib = [];
    user.myLibNogi = [];
    user.prop_tec = [];
    user.agrupamento = ['2'];

    logado = false;
    token = '';
    
  }

  @action
  void atualizarLib(libs, email){
    user.agrupamento = (libs ?? []).cast<String>();
    user.agrupamento.add(email);

    user = user;
    //print(user);
  }

  @action
  void updateMyTec(tec){
    user.prop_tec = tec;
    user = user;
  }

  @action
  void addMyLib(aula){
    user.myLib.add(aula);
    user = user;
  }

  @action
  void addMyLibNoGi(aula){
    user.myLibNogi.add(aula);
    user = user;
  }

  @action removeMyLib(index){
    user.myLib.removeAt(index);
    user = user;
  }

  @action
  void removeMyLibNoGi(index){
    user.myLibNogi.removeAt(index);
    user = user;
  }

  @action
  void setLibCarregada(lib){
    _libCarregada = lib;
  }

  List getPosicoes(gi) {
    if(gi){
      return user.myLib;
    }else{
      return user.myLibNogi;
    }
  }

  List get getMyTec => user.prop_tec;
  String get getEmail => user.email;
  String get getToken => token;
  List get libCarregada => _libCarregada;

}