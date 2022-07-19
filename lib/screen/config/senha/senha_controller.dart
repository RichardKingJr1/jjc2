import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/screen/login/recuperar_senha.dart';
import 'package:jjc/stores/userStore.dart';
import 'package:jjc/widgets/alertDialog.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jjc/global_services/global.dart' as global;

class SenhaController {

  SenhaController();

  final url = Uri.parse(global.endereco + 'mudar_senha');

  var userStore = GetIt.I.get<UserStore>();

  @observable
  String _senhaAtual = '';

  @observable
  String _novaSenha = '';

  @observable
  String _confirmarSenha = '';

  TextEditingController controllerSenha = TextEditingController();
  TextEditingController controllerNsenha = TextEditingController();
  TextEditingController controllerCsenha = TextEditingController();


  String get senhaAtual => _senhaAtual;
  String get novaSenha => _novaSenha;
  String get confirmarSenha => _confirmarSenha;

  @action
  void setSenha(String value){
    _novaSenha = value;
  }

  @action
  void setSenhaAtual(String value){
    _senhaAtual = value;
  }

  @action
  void setCSenha(String value){
    _confirmarSenha = value;
  }

  trocarSenha(context, overlay_) async {
    if (_novaSenha == _confirmarSenha) {
      Map dataObj = {
        'usuario': userStore.user.email,
        'senha': _senhaAtual,
        'nova_senha': _novaSenha
      };

      overlay_.show();

      //String S_dataObj = jsonEncode(dataObj);

      await http
          .post(url,
              headers: {"Content-Type": "application/json"},
              body: jsonEncode(dataObj))
          .then((response) async {
        if (response.statusCode == 200) {
          overlay_.hide();
          await Dialogs.alerta(context, AppLocalizations.of(context)!.alertaSenhaAtualizada, AppLocalizations.of(context)!.ok);
          Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);

        } else {
            Dialogs.alerta(context, AppLocalizations.of(context)!.alertaSenhaIncorreta, AppLocalizations.of(context)!.ok);
            controllerSenha.clear();
            controllerNsenha.clear();
            controllerCsenha.clear();
        }
      }).onError((error, stackTrace) {
        return null;
      });   
      overlay_.hide();
    } else {
      Dialogs.alerta(context, AppLocalizations.of(context)!.alertaSenhaDiferente, AppLocalizations.of(context)!.ok);
    }
  }

}