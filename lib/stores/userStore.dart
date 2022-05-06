import 'package:jjc/models/user_model.dart';
import 'package:mobx/mobx.dart';
part 'userStore.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {

  @observable
  userModel user = userModel();

  bool logado = false;

  String token = '';

  @action
  storeUserData(token, String id_user, String email, List myLib, List myLibNogi, List prop_tec, List<String> agrupamento){
    user.id_user = id_user;
    user.email = email;
    user.myLib = myLib;
    user.myLibNogi = myLibNogi;
    user.prop_tec = prop_tec;
    agrupamento.add(email);
    user.agrupamento = agrupamento;

    logado = true;
    token = token;
  }

  @action
  eraseUserData(){
    user.id_user = '';
    user.email = 'email';
    user.myLib = [];
    user.myLibNogi = [];
    user.prop_tec = [];
    user.agrupamento = ['2'];

    logado = false;
    token = '';
    
  }

}