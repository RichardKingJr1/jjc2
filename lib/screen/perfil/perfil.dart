import 'package:flutter/material.dart';
import 'package:jjc/global_services/global.dart' as global;
import 'package:jjc/widgets/app_botton.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Container(
        child: Material(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                margin: EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(80000, 65)),
                  // fromHeight use double.infinity as width and 40 is the height
                  child: Text('Sair'),
                  onPressed: () => logout(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: appBotton(cont: context, selectedIndex: 3),
    );
  }

  void logout() {

     global.globalVar['id_user'] = '';
    global.globalVar['logado'] = false;
    global.myLib = [];
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }
}
