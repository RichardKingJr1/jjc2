import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DropDownValue {

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
    Map subtipo = {
      'Passagem': AppLocalizations.of(cont)!.passagem,
      'Raspagem': AppLocalizations.of(cont)!.raspagem,
      'Finalização': AppLocalizations.of(cont)!.finalizacao,
      'Reposição': AppLocalizations.of(cont)!.reposicao,
      'Outra': AppLocalizations.of(cont)!.outra
    };

    return subtipo;
  }

}