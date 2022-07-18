import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/global_services/global.dart' as global;
import 'package:http/http.dart' as http;
import 'package:jjc/stores/userStore.dart';
import 'package:jjc/widgets/alertDialog.dart';

class MinhasBibliotecasController {

  static final MinhasBibliotecasController instance = MinhasBibliotecasController._();
  MinhasBibliotecasController._();

  var userStore = GetIt.I.get<UserStore>();

  TextEditingController controllerBibliotecaId = TextEditingController();

  String _bibliotecaId = '';

  String get bibliotecaId => _bibliotecaId;

  void setBibliotecaId(String value) {
    _bibliotecaId = value;
  }

  adicionar(context, overlay_) async {
    overlay_.show();

    Map dataObj = {
      'email': userStore.user.email,
      'biblioteca_id': _bibliotecaId,
    };

    await http
        .post(Uri.parse(global.endereco + 'adicionar_lib'),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(dataObj))
        .then(
          (response) => {
            if (response.statusCode == 200)
              {
                atualizar(),
                controllerBibliotecaId.clear(),
                Dialogs.alerta(context, 'Lib Adicionada', 'OK')
                //dialog(context, 'Lib Adicionada'),
              },
          },
        );
    overlay_.hide();
  }

  apagar(indexBiblioteca, context, overlay_) async {
    overlay_.show();

    //String S_dataObj = jsonEncode(dataObj);
    Map dataObj = {
      'email': userStore.user.email,
      'index': indexBiblioteca,
    };

    await http
        .post(Uri.parse(global.endereco + 'excluir_lib'),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(dataObj))
        .then(
          (response) => {
            if (response.statusCode == 200)
              {
                atualizar(),
                //dialog(context, 'Lib excluida'),
                Dialogs.alerta(context, 'Lib excluida', 'OK')
              },
          },
        );

    overlay_.hide();
  }

  atualizar() async {
    Map dataObj = {'token': userStore.token, 'email': userStore.user.email};

    await http
        .post(Uri.parse(global.endereco + 'update_tec'),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(dataObj))
        .then((response) {


          dynamic data = json.decode(utf8.decode(response.bodyBytes));

          if (response.statusCode == 200) {
            //Fazer login no global service
            userStore.atualizarLib(data['libs'], dataObj['email']);
          } 
    });
  }

  
}