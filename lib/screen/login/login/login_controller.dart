import 'package:flutter/material.dart';
import 'package:jjc/screen/widgets/alertDialog.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jjc/global_services/global.dart' as global;
import 'package:jjc/screen/widgets/floatingActionButton/floatinAction_controller.dart';

class login_controller {

  static final login_controller instance = login_controller._();
  login_controller._();

  final url = Uri.parse(global.endereco + 'login');

  TextEditingController controller_senha = TextEditingController();
  final storage = new FlutterSecureStorage();

  void submit(cont, email, senha, overlayCont, ctrl) async {
    Map dataObj = {'email': email, 'senha': senha};

    if(ctrl){
      overlayCont.show();
    }
    
    await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(dataObj))
    .then((response) async {

      dynamic data = json.decode(utf8.decode(response.bodyBytes));

      if (response.statusCode == 200) {
        //Fazer login no global service
        //global.globalVar['logado'] = true;
        global.globalVar['email'] = data['user']['email'];
        global.myLib = data['user']['m_tec'];
        global.myLibNogi = data['user']['m_tec_nogi'];
        global.token = data['token'];
        global.agrupamento = (data['user']['libs'] ?? []).cast<String>();
        global.agrupamento.add(data['user']['email']);

        floatinAction_controller.instance.updateMyTec(data['user']['prop_tec']);
        floatinAction_controller.instance.logedIn(true);
        floatinAction_controller.instance.setPosicao();
        

        if(ctrl){
          //salva login e senha localmente
          await storage.write(key: "credenciais", value: json.encode(dataObj));

          Navigator.of(cont)
              .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);

          overlayCont.hide();
          controller_senha.clear();
        }
      } else {
        if(ctrl){
          Dialogs.alerta(cont, "Email ou senha incorretos", "Ok");
          controller_senha.clear();
          overlayCont.hide();
        }
      }
    });
  }

  void login() async {

    String? credenciais = await storage.read(key: 'credenciais');

    if(credenciais is String){

      var valores = jsonDecode(credenciais);

      submit('cont', valores['email'], valores['senha'], 'overlayCont', false);
      
    }else{
      floatinAction_controller.instance.logedIn(false);
    }
  }

  logout(cont) async {
    global.globalVar['id_user'] = '';
    global.myLib = [];
    global.lib_carregada = [];
    global.agrupamento = ['2'];
    global.token = '';
    Navigator.of(cont).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);

    floatinAction_controller.instance.updateMyTec([]);
    floatinAction_controller.instance.logedIn(false);

    await storage.deleteAll();
  }
}