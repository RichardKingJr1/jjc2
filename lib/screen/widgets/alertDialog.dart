import 'package:flutter/material.dart';

//enum DialogAction { yes, abort }

class Dialogs {
  //static Future<DialogAction> yesAbortDialog(
  static Future alerta(
    BuildContext context,
    String titulo,
    String botao,
  ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          actions: <Widget>[
            Align(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(botao)),
            )
          ],
        );
      },
    );
    //return (action != null) ? action : DialogAction.abort;
    return action;
  }
}
