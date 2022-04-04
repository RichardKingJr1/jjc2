import 'package:flutter/material.dart';
import 'package:jjc/global_services/global.dart' as global;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class menuDrawer extends StatelessWidget {
  const menuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text(AppLocalizations.of(context)!.minhasPosicoes),
            onTap: () => visitar(context, '/minhas_posicoes'),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.minhasBibliotecas),
            onTap: () => visitar(context, '/minhas_bibliotecas'),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.idioma),
            onTap: () => visitar(context, '/idioma'),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.trocarSenha),
            onTap: () => visitar(context, '/senha'),
          ),
          ListTile(
            //leading: Icon(Icons.logout),
            title: Text(AppLocalizations.of(context)!.sair),
            onTap: () => logout(context),
          )
        ],
      ),
    );
  }

  visitar(cont, endereco) {
    Navigator.of(cont).pushNamed(endereco);
  }

  logout(cont) {
    global.globalVar['id_user'] = '';
    global.globalVar['logado'] = false;
    global.myLib = [];
    global.lib_carregada = [];
    global.agrupamento = ['1'];
    global.token = '';
    Navigator.of(cont)
        .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }
}
