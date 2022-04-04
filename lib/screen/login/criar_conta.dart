import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:jjc/global_services/global.dart' as global;
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class criarConta extends StatefulWidget {
  //final url = Uri.parse('http://10.0.2.2:4000/criar_conta');
  final url = Uri.parse(global.endereco + 'criar_conta');

  criarConta({Key? key}) : super(key: key);

  @override
  _criarContaState createState() => _criarContaState();
}

class _criarContaState extends State<criarConta> {
  String email = '';
  String senha = '';
  String csenha = '';

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
                  child: Text(AppLocalizations.of(context)!.criarConta,
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.email,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => setState(() => email = value),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.senha,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => setState(() => senha = value),
                    obscureText: true,
                  ),
                ),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.csenha,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => setState(() => csenha = value),
                    obscureText: true,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(400, 65)),
                    // fromHeight use double.infinity as width and 40 is the height
                    child: Text(AppLocalizations.of(context)!.criarConta),
                    onPressed: () => submit(),
                  ),
                ),
                Container(
                  child: TextButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(400, 65)),
                    // fromHeight use double.infinity as width and 40 is the height
                    child: Text(AppLocalizations.of(context)!.login),
                    onPressed: () =>
                        {Navigator.of(context).pushNamed('/login')},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submit() async {
    if (senha == csenha) {
      Map dataObj = {'email': email, 'senha': senha};
      context.loaderOverlay.show();
      //String S_dataObj = jsonEncode(dataObj);

      await http
          .post(widget.url,
              headers: {"Content-Type": "application/json"},
              body: jsonEncode(dataObj))
          .then((response) {
        setState(() {
          if (response.statusCode == 200) {
            dialog(context, 'Conta Criada');
          } else if (response.statusCode == 401) {
            dialog(context, 'Email já cadastrado');
          } else {
            dialog(context, 'Erro');
          }
        });
      });
      context.loaderOverlay.hide();
    }
  }

  Widget dialog(BuildContext context, msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: AlertDialog(
            title: Text(msg),
            actions: [
              Align(
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: () {
                      if (msg == 'Conta Criada') {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/login', (Route<dynamic> route) => false);
                      } else {
                        Navigator.pop(context);
                      }
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
