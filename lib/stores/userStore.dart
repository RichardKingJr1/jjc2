import 'package:jjc/models/aula_model.dart';
import 'package:jjc/models/user_model.dart';
import 'package:jjc/repository/aula_repository.dart';
import 'package:mobx/mobx.dart';
part 'userStore.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {

  var respositorio = aulaRepository();

  @observable
  UserModel user = UserModel(myLib: [], myLibNogi: [], propTec: [] ,agrupamento: ['2']);

  @observable
  bool logado = false;

  @observable
  String token = '';

  @observable
  List _libCarregada = [];

  @action
  void login(token, String id_user, String email, List<AulaModel> myLib, List<AulaModel> myLibNogi, List<AulaModel> prop_tec, List<String> agrupamento){
    user.id_user = id_user;
    user.email = email;
    user.myLib = myLib;
    user.myLibNogi = myLibNogi;
    user.propTec = prop_tec;
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
    user.propTec = [];
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
  void updateMyTec(List<AulaModel> tec){
    user.propTec = tec;
    user = user;
  }

  @action
  void addMyLib( AulaModel aula){
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

  @action
  void contarRep(int index, int valor, bool gi){
    if(gi){
      user.myLib[index].reps  = user.myLib[index].reps! + valor;
      
    }else{
      user.myLibNogi[index].reps = user.myLibNogi[index].reps! + valor;
    }

    var dataObj = {
      'email': user.email,
      'gi': gi,
      'index': index,
      'reps': gi ? user.myLib[index].reps : user.myLibNogi[index].reps,
    };

    respositorio.contarRep(dataObj);
    user = user;
  }

  List<AulaModel> getPosicoes(gi) {
    if(gi){
      return user.myLib;
    }else{
      return user.myLibNogi;
    }
  }

  List<AulaModel> get getMyTec => user.propTec;
  String get getEmail => user.email;
  String get getToken => token;
  List get libCarregada => _libCarregada;

}