import 'package:flutter/material.dart';
import 'package:jjc/global_services/global.dart' as global;

class menuDrawer extends StatelessWidget {
  const menuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Minhas Posições"),
            onTap: () => visitar(context, '/minhas_posicoes'),
          ),
          ListTile(
            title: Text("Minhas Bibliotecas"),
            onTap: () => visitar(context, '/minhas_bibliotecas'),
          ),
          /* ListTile(
            leading: Icon(Icons.chat),
            title: Text("Idioma"),
            onTap: () => {},
          ), */
          ListTile(
            //leading: Icon(Icons.logout),
            title: Text("Sair"),
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
