import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/global_services/global.dart' as global;
import 'package:jjc/stores/globalStore.dart';

class floatinAction_controller {

  var storeGlobal = GetIt.I.get<GlobalStore>();

  static final floatinAction_controller instance = floatinAction_controller._();
  floatinAction_controller._();

  List posicoes = global.myLib;
  
  setGi() => storeGlobal.setGi();
  bool get gi => storeGlobal.gi; 

}