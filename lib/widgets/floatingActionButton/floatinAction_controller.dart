import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/global_services/global.dart' as global;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jjc/stores/globalStore.dart';

class floatinAction_controller {

  var storeGlobal = GetIt.I.get<GlobalStore>();

  static final floatinAction_controller instance = floatinAction_controller._();
  floatinAction_controller._();

  //final propTec = ValueNotifier<List>(global.prop_tec);


  List posicoes = global.myLib;

  getFaixa(cont){
    Map faixa = {
      'Branca': AppLocalizations.of(cont)!.branca,
      'azul': AppLocalizations.of(cont)!.azul,
      'roxa': AppLocalizations.of(cont)!.roxa,
      'marrom': AppLocalizations.of(cont)!.marrom,
      'preta': AppLocalizations.of(cont)!.preta
    };

    return faixa;
  }

  getSub(cont){
    Map faixa = {
      'Passagem': AppLocalizations.of(cont)!.passagem,
      'Raspagem': AppLocalizations.of(cont)!.raspagem,
      'Finalização': AppLocalizations.of(cont)!.finalizacao,
      'Reposição': AppLocalizations.of(cont)!.reposicao,
      'Outra': AppLocalizations.of(cont)!.outra
    };

    return faixa;
  }
  
  setGi() => storeGlobal.setGi();
  bool get gi => storeGlobal.gi; 

}