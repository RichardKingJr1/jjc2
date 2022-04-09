import 'package:flutter/cupertino.dart';
import 'package:jjc/global_services/global.dart' as global;

class floatinAction_controller {


  static final floatinAction_controller instance = floatinAction_controller._();
  floatinAction_controller._();

  final gi = ValueNotifier<bool>(global.globalVar['gi']);

  final propTec = ValueNotifier<List>(global.prop_tec);

  List posicoes = global.myLib;

  setGi(){
    gi.value = !gi.value;
    global.globalVar['gi'] = !global.globalVar['gi'];

    if(global.globalVar['gi']){
      posicoes = global.myLib;
    }else{
      posicoes = global.myLibNogi;
    }
  }

  updateMyTec(data){
    print('object');
    propTec.value = data;
    global.prop_tec = data;
  }
}