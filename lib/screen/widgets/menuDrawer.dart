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
            leading: Icon(Icons.chat),
            title: Text("Idioma"),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Sair"),
            onTap: () => logout(context),
          )
        ],
      ),
    );
  }

  logout(cont) {
    global.globalVar['id_user'] = '';
    global.globalVar['logado'] = false;
    global.myLib = [];
    Navigator.of(cont)
        .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }
}
