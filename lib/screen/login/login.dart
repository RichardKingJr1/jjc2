import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jjc/global_services/global.dart' as global;
import 'package:loader_overlay/loader_overlay.dart';

class Login extends StatefulWidget {
  //final url = Uri.parse('http://10.0.2.2:4000/login');
  final url = Uri.parse(global.endereco + 'login');

  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  String senha = '';

  TextEditingController _controller_senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: const Text('Aula'),
      ), */
      body: Material(
        child: SafeArea(
          child: Container(
            //alignment: Alignment.center,
            transform: Matrix4.translationValues(0.0, -40.0, 0.0),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 60),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => setState(() => email = value),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: _controller_senha,
                    decoration: InputDecoration(
                      hintText: "Senha",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => setState(() => senha = value),
                    obscureText: true,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(400, 65)),
                    // fromHeight use double.infinity as width and 40 is the height
                    child: Text('Login'),
                    onPressed: () => {submit()},
                  ),
                ),
                Container(
                  child: TextButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(400, 65)),
                    // fromHeight use double.infinity as width and 40 is the height
                    child: Text('Criar conta'),
                    onPressed: () =>
                        //{Navigator.of(context).pushNamed('/criar_conta')},
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/criar_conta', (Route<dynamic> route) => false),
                  ),
                ),
                Container(
                  child: TextButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(400, 65)),
                    // fromHeight use double.infinity as width and 40 is the height
                    child: Text('Recuperar senha'),
                    onPressed: () =>
                        //{Navigator.of(context).pushNamed('/criar_conta')},
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/recuperar_senha',
                            (Route<dynamic> route) => false),
                  ),
                ),
                Container(
                  child: TextButton(
                      style:
                          ElevatedButton.styleFrom(minimumSize: Size(400, 65)),
                      // fromHeight use double.infinity as width and 40 is the height
                      child: Text('Continuar deslogado'),
                      onPressed: () =>
                          //{Navigator.of(context).pushNamed('/criar_conta')},
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/', (Route<dynamic> route) => false)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submit() async {
    Map dataObj = {'email': email, 'senha': senha};

    context.loaderOverlay.show();
    //String S_dataObj = jsonEncode(dataObj);

    await http
        .post(widget.url,
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(dataObj))
        .then((response) {
      dynamic data = json.decode(utf8.decode(response.bodyBytes));

      if (response.statusCode == 200) {
        //Fazer login no global service
        global.globalVar['logado'] = true;
        global.globalVar['email'] = data['user']['email'];
        global.myLib = data['user']['m_tec'];
        global.prop_tec = data['user']['prop_tec'];
        global.token = data['token'];
        global.agrupamento.add(data['user']['email']);

        Navigator.of(context)
            .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      } else {
        //Alerta de senha ou email incorretos
        dialog(context);
        _controller_senha.clear();
      }
    });

    context.loaderOverlay.hide();
  }

  Widget dialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: AlertDialog(
            title: Text("Email ou senha incorretos"),
            actions: [
              Align(
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Ok")),
              )
            ],
          ),
        );
      },
    );
    return Text('dsfadsf');
  }
}
