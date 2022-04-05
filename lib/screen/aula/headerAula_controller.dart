import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jjc/global_services/global.dart' as global;

class headerAula_controller {

  static final headerAula_controller instance = headerAula_controller._();
  headerAula_controller._();

  final url1 = Uri.parse(global.endereco + 'add_to_lib');
  final url2 = Uri.parse(global.endereco + 'exclude_from_lib');
  
  final existe = ValueNotifier<bool>(false);

  void setExiste(value){
    existe.value = value;
  }

  dynamic adicionarPosicao(indexPosicao) async {
    Map dataObj = global.lib_carregada[indexPosicao];
    dataObj['email'] = global.globalVar['email'];
    dataObj['gi'] = global.globalVar['gi'];

    await http
        .post(url1,
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(dataObj))
        .then((response) {

      if(global.globalVar['gi']){
        global.myLib.add(global.lib_carregada[indexPosicao]);
      }else{
        global.myLibNogi.add(global.lib_carregada[indexPosicao]);
      }  

      existe.value = true;
    });
  }

  dynamic excluirPosicao(indexPosicao) async {
    
    int index;   

    if(global.globalVar['gi']){
      index = global.myLib.indexWhere((item) =>  item['idVideo'] == global.lib_carregada[indexPosicao]['idVideo']);
    }else{
      index = global.myLibNogi.indexWhere((item) =>  item['idVideo'] == global.lib_carregada[indexPosicao]['idVideo']);
    }

    Map dataObj = {
      'index': index,
      'email':global.globalVar['email'],
      'gi': global.globalVar['gi']
    };

    await http
        .post(url2,
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(dataObj))
        .then((response) {

      if(global.globalVar['gi']){
        global.myLib.removeAt(index);
      }else{
        global.myLibNogi.removeAt(index);
      }
      existe.value = false;
    });
  }

}