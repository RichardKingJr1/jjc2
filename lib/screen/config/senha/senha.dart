import 'package:flutter/material.dart';
import 'package:jjc/global_services/global.dart' as global;
import 'package:jjc/screen/config/senha/senha_controller.dart';
import 'package:jjc/widgets/menuDrawer.dart';
import 'package:loader_overlay/loader_overlay.dart';


import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Senha extends StatefulWidget {
  Senha({Key? key}) : super(key: key);

  @override
  State<Senha> createState() => _SenhaState();
}

class _SenhaState extends State<Senha> {


  SenhaController senhaController = SenhaController();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      endDrawer: senhaController.userStore.token != '' ? menuDrawer() : null,
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
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: senhaController.controllerSenha,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.senhaAtual,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: senhaController.setSenhaAtual,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: senhaController.controllerNsenha,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.senhaNova,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: senhaController.setSenha,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: senhaController.controllerCsenha,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.confirmarSenha,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: senhaController.setCSenha,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(400, 65)),
                    // fromHeight use double.infinity as width and 40 is the height
                    child: Text(AppLocalizations.of(context)!.senhaTrocar),
                    //onPressed: () => {submit()},
                    onPressed: () => senhaController.trocarSenha(context, context.loaderOverlay),
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

  

  /* Widget dialog(BuildContext context, String msg) {
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
  } */
}
