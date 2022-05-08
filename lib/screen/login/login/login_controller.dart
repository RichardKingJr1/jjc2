import 'package:flutter/material.dart';
import 'package:jjc/repository/user_repository.dart';
import 'package:jjc/stores/userStore.dart';
import 'package:jjc/widgets/alertDialog.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class loginController {

  late UserStore userStore;

  loginController({ required this.userStore});

  var repository = userRepository();

  bool get uptodate => userStore.logado;

  TextEditingController controller_senha = TextEditingController();
  final localStorage = new FlutterSecureStorage();

  void submit(cont, email, senha, overlayCont, ctrl) async {
    Map dataObj = {'email': email, 'senha': senha};

    if(ctrl){
      overlayCont.show();
    }
    
    repository.loginRequest(dataObj)
    .then((response) async {

      dynamic data = json.decode(utf8.decode(response.bodyBytes));

      if (response.statusCode == 200) {
        //Fazer login no global service

        userStore.login(data['token'], email, email, data['user']['m_tec'], data['user']['m_tec_nogi'], data['user']['prop_tec'], data['user']['libs'] ?? []);

        if(ctrl){
          //salva login e senha localmente
          await localStorage.write(key: "credenciais", value: json.encode(dataObj));

          overlayCont.hide();
          controller_senha.clear();

          Navigator.of(cont)
              .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);

        }
      } else {
        if(ctrl){
          controller_senha.clear();
          overlayCont.hide();
          Dialogs.alerta(cont, AppLocalizations.of(cont)!.alertaSenhaEmailIncorreto, AppLocalizations.of(cont)!.ok);
        }
      }
    });
  }

  Future<void> login() async {

    String? credenciais = await localStorage.read(key: 'credenciais');

    if(credenciais is String){

      var valores = jsonDecode(credenciais);

      submit('cont', valores['email'], valores['senha'], 'overlayCont', false);
      
    }
    return ;
  } 

  logout(cont) async {

    userStore.logout();

    Navigator.of(cont).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);

    await localStorage.deleteAll();

  }
}