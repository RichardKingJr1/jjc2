import 'package:get_it/get_it.dart';
import 'package:jjc/stores/globalStore.dart';
import 'package:jjc/stores/userStore.dart';

class floatinAction_controller {

  var storeGlobal = GetIt.I.get<GlobalStore>();
  var userStore = GetIt.I.get<UserStore>();

  static final floatinAction_controller instance = floatinAction_controller._();
  floatinAction_controller._();
  
  setGi() => storeGlobal.setGi();
  bool get gi => storeGlobal.gi; 

}