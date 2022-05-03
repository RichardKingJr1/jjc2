import 'package:flutter/material.dart';
import 'package:jjc/global_services/global.dart' as global;
import 'package:http/http.dart' as http;
import 'package:jjc/widgets/menuDrawer.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'dart:convert';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Senha extends StatefulWidget {
  Senha({Key? key}) : super(key: key);

  final url = Uri.parse(global.endereco + 'mudar_senha');

  @override
  State<Senha> createState() => _SenhaState();
}

class _SenhaState extends State<Senha> {
  String senha_atual = '';
  String nova_senha = '';
  String confirmar_senha = '';

  TextEditingController _controller_senha = TextEditingController();
  TextEditingController _controller_nsenha = TextEditingController();
  TextEditingController _controller_csenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      endDrawer: global.token != '' ? menuDrawer() : null,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.senhaTrocar),
      ),
      body: Material(
        child: SafeArea(
          child: Container(
            transform: Matrix4.translationValues(0.0, 200.0, 0.0),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                /* Container(
                  margin: EdgeInsets.only(bottom: 60),
                  child: Text(
                    'Trocar Senha',
                    style: TextStyle(fontSize: 40),
                  ),
                ), */
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: _controller_senha,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.senhaAtual,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => setState(() => senha_atual = value),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: _controller_nsenha,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.senhaNova,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => setState(() => nova_senha = value),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: _controller_csenha,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.confirmarSenha,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) =>
                        setState(() => confirmar_senha = value),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(400, 65)),
                    // fromHeight use double.infinity as width and 40 is the height
                    child: Text(AppLocalizations.of(context)!.senhaTrocar),
                    //onPressed: () => {submit()},
                    onPressed: () => trocarSenha(),
                  ),
                ),
                Container(
                  child: TextButton(
                      style:
                          ElevatedButton.styleFrom(minimumSize: Size(400, 65)),
                      // fromHeight use double.infinity as width and 40 is the height
                      child: Text(AppLocalizations.of(context)!.voltar),
                      onPressed: () =>
                          //{Navigator.of(context).pushNamed('/criar_conta')},
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/', (Route<dynamic> route) => false)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  trocarSenha() async {
    if (nova_senha == confirmar_senha) {
      Map dataObj = {
        'usuario': global.globalVar['email'],
        'senha': senha_atual,
        'nova_senha': nova_senha
      };

      context.loaderOverlay.show();

      //String S_dataObj = jsonEncode(dataObj);

      await http
          .post(widget.url,
              headers: {"Content-Type": "application/json"},
              body: jsonEncode(dataObj))
          .then((response) {
        if (response.statusCode == 200) {
          setState(() {
            dialog(context, AppLocalizations.of(context)!.alertaSenhaAtualizada);
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
            //_controller_nome.clear();
          });
        } else {
          setState(() {
            dialog(context, AppLocalizations.of(context)!.alertaSenhaIncorreta);
            _controller_senha.clear();
            _controller_nsenha.clear();
            _controller_csenha.clear();
          });
        }
      });

      context.loaderOverlay.hide();
    } else {
      dialog(context, AppLocalizations.of(context)!.alertaSenhaDiferente);
    }
  }

  Widget dialog(BuildContext context, String msg) {
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
                      Navigator.of(context).pop();
                    },
                    child: Text(AppLocalizations.of(context)!.ok)),
              )
            ],
          ),
        );
      },
    );
    return Text('dsfadsf');
  }
}
