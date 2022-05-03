import 'package:flutter/cupertino.dart';
import 'package:jjc/global_services/global.dart' as global;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class floatinAction_controller {


  static final floatinAction_controller instance = floatinAction_controller._();
  floatinAction_controller._();

  final gi = ValueNotifier<bool>(global.globalVar['gi']);
  final propTec = ValueNotifier<List>(global.prop_tec);
  final logado = ValueNotifier<bool?>(null);

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

  setGi(){
    gi.value = !gi.value;
    global.globalVar['gi'] = !global.globalVar['gi'];

    setPosicao();
  }

  setPosicao(){
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

  logedIn(status){
    global.globalVar['logado'] = status;
    logado.value = status;
  }
}