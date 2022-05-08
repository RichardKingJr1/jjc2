import 'package:flutter/material.dart';
import 'package:jjc/screen/login/criar_conta/criar_conta_controller.dart';

import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class criarConta extends StatefulWidget {

  criarConta({Key? key}) : super(key: key);

  @override
  _criarContaState createState() => _criarContaState();
}

class _criarContaState extends State<criarConta> {
  
  var instance = criarContaController();

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
                    onChanged: (value) => setState(() => instance.email = value),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.senha,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => setState(() => instance.senha = value),
                    obscureText: true,
                  ),
                ),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.csenha,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => setState(() => instance.csenha = value),
                    obscureText: true,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(400, 65)),
                    // fromHeight use double.infinity as width and 40 is the height
                    child: Text(AppLocalizations.of(context)!.criarConta),
                    onPressed: () => instance.submit(context.loaderOverlay, context),
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
}
