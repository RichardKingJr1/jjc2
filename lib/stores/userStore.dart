import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jjc/models/aula_model.dart';
import 'package:jjc/models/user_model.dart';
import 'package:jjc/repository/aula_repository.dart';
import 'package:mobx/mobx.dart';
part 'userStore.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {

  var respositorio = aulaRepository();
  final localStorage = FlutterSecureStorage();

  UserStoreBase(){
    carregarTecnicasLocais();
  }

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

    localStorage.delete(key: 'user');
    
  }

  @action
  void atualizarLib(libs, email){
    user.agrupamento = (libs ?? []).cast<String>();
    user.agrupamento.add(email);

    user = user;
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
    atualizaUserLocal(user);
  }

  @action
  void addMyLibNoGi(aula){
    user.myLibNogi.add(aula);
    user = user;
    atualizaUserLocal(user);
  }

  @action removeMyLib(index){
    user.myLib.removeAt(index);
    user = user;
    atualizaUserLocal(user);
  }

  @action
  void removeMyLibNoGi(index){
    user.myLibNogi.removeAt(index);
    user = user;
    atualizaUserLocal(user);
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

  void carregarTecnicasLocais() async {
    String? userLocalString = await localStorage.read(key: 'user');
    UserModel? userLocal;

    if(userLocalString == null){
     userLocal =  UserModel(myLib: [], myLibNogi: [], propTec: [] ,agrupamento: ['2']);
    }else{
      userLocal = UserModel.fromJson(json.decode(userLocalString));
    }
    
    user = userLocal;
  }

  void atualizaUserLocal(UserModel user) {
    String userString = json.encode(user.toJson()); 
    localStorage.write(key: 'user', value: userString);
  }

  List<AulaModel> get getMyTec => user.propTec;
  String get getEmail => user.email;
  String get getToken => token;
  List get libCarregada => _libCarregada;

}