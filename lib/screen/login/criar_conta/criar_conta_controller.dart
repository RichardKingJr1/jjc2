import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jjc/repository/user_repository.dart';

import 'package:jjc/widgets/alertDialog.dart';

class criarContaController {

  var repository = userRepository();

  String email = '';
  String senha = '';
  String csenha = '';

  void submit(overlay, cont) async {
    if (senha == csenha) {
      Map dataObj = {'email': email, 'senha': senha};
      overlay.show();
      //String S_dataObj = jsonEncode(dataObj);

      repository.registerRequest(dataObj)
      .then((response) {
        if (response.statusCode == 200) {
          Dialogs.alerta(cont, AppLocalizations.of(cont)!.contaCriada, AppLocalizations.of(cont)!.ok);
          Navigator.of(cont).pushNamedAndRemoveUntil('/lib', (Route<dynamic> route) => false);
        } else if (response.statusCode == 401) {
          Dialogs.alerta(cont, AppLocalizations.of(cont)!.emailJaCadastrado, AppLocalizations.of(cont)!.ok);
        } else {
          Dialogs.alerta(cont, AppLocalizations.of(cont)!.erro, AppLocalizations.of(cont)!.ok);
        }
      });
      overlay.hide();
    }else{
      Dialogs.alerta(cont, AppLocalizations.of(cont)!.alertaSenhaDiferente, AppLocalizations.of(cont)!.ok);
    }
  }

}