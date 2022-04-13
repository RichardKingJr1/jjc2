import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jjc/screen/login/login/login_controller.dart';

import 'package:loader_overlay/loader_overlay.dart';

class Login extends StatefulWidget {

  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  String senha = '';

  //login_controller instance = login_controller();

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
                    AppLocalizations.of(context)!.login,
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
                  margin: EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(400, 65)),
                    // fromHeight use double.infinity as width and 40 is the height
                    child: Text(AppLocalizations.of(context)!.login),
                    onPressed: () => {login_controller.instance.submit(context, email, senha, context.loaderOverlay, true)},
                  ),
                ),
                Container(
                  child: TextButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(400, 65)),
                    // fromHeight use double.infinity as width and 40 is the height
                    child: Text(AppLocalizations.of(context)!.criarConta),
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
                    child: Text(AppLocalizations.of(context)!.recSenha),
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
                      child: Text(AppLocalizations.of(context)!.contDeslogado),
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
}
 