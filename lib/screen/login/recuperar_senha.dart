import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jjc/global_services/global.dart' as global;
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RecuperarSenha extends StatefulWidget {
  final url = Uri.parse(global.endereco + 'recuperar_senha');

  RecuperarSenha({Key? key}) : super(key: key);

  @override
  _RecuperarSenhaState createState() => _RecuperarSenhaState();
}

class _RecuperarSenhaState extends State<RecuperarSenha> {
  String email = '';

  TextEditingController _controller_email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: SafeArea(
          child: Container(
            transform: Matrix4.translationValues(0.0, 200.0, 0.0),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 60),
                  child: Text(
                    AppLocalizations.of(context)!.recSenha,
                    style: const TextStyle(fontSize: 40),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.email,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => setState(() => email = value),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: const Size(400, 65)),
                    // fromHeight use double.infinity as width and 40 is the height
                    child: Text(AppLocalizations.of(context)!.recSenha),
                    onPressed: () => {submit()},
                    //onPressed: () => {},
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
                              '/login', (Route<dynamic> route) => false)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submit() async {
    Map dataObj = {'email': email};

    context.loaderOverlay.show();
    //String S_dataObj = jsonEncode(dataObj);

    await http
        .post(widget.url,
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(dataObj))
        .then((response) {
      if (response.statusCode == 200) {
        //Fazer login no global service
        dialog(context, "Recuperação da senha enviada para o seu email");
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      } else {
        //Alerta de senha ou email incorretos
        dialog(context, "Erro");
        _controller_email.clear();
      }
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
