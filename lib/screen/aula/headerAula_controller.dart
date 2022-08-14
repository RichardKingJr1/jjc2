import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jjc/global_services/global.dart' as global;
import 'package:jjc/models/aula_model.dart';
import 'package:jjc/stores/globalStore.dart';
import 'package:jjc/stores/userStore.dart';

class headerAula_controller {

  static final headerAula_controller instance = headerAula_controller._();
  headerAula_controller._();

  var userStore = GetIt.I.get<UserStore>();
  var globalStore = GetIt.I.get<GlobalStore>();

  final url1 = Uri.parse(global.endereco + 'add_to_lib');
  final url2 = Uri.parse(global.endereco + 'exclude_from_lib');
  
  final existe = ValueNotifier<bool>(false);

  void setExiste(value){
    existe.value = value;
  }

  dynamic adicionarPosicao(aula) async {
    Map dataObj = aula;

    if(userStore.logado == true){
      dataObj['email'] = userStore.user.email;
      dataObj['gi'] = globalStore.gi;
      dataObj['reps'] = 0;

      await http
          .post(url1,
              headers: {"Content-Type": "application/json"},
              body: jsonEncode(dataObj))
          .then((response) {

        addLocalmente(aula);

        existe.value = true;
      });
    }else{
      addLocalmente(aula);
    }
    
  }

  void addLocalmente(aula) {
    if(globalStore.gi){
      userStore.addMyLib(AulaModel.fromJson(aula));
    }else{
      userStore.addMyLibNoGi(AulaModel.fromJson(aula));
    } 

    existe.value = true;
  }

  dynamic excluirPosicao(aula) async {
    
    int index;   

    if(globalStore.gi){
      index = userStore.getPosicoes(true).indexWhere((item) =>  item.idVideo == aula['idVideo']);
    }else{
      index = userStore.getPosicoes(false).indexWhere((item) =>  item.idVideo == aula['idVideo']);
    }

    if(userStore.logado == true){
      Map dataObj = {
        'index': index,
        'email':userStore.getEmail,
        'gi': globalStore.gi
      };

      await http
          .post(url2,
              headers: {"Content-Type": "application/json"},
              body: jsonEncode(dataObj))
          .then((response) {

            removeLocalmente(index);

      });
    }else{
      removeLocalmente(index);
    }
    
  }

  void removeLocalmente(index){
    if(globalStore.gi){
      userStore.removeMyLib(index);
    }else{
      userStore.removeMyLibNoGi(index);
    }

    existe.value = false;
  }

}