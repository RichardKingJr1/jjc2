import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/global_services/global.dart' as global;
import 'package:jjc/screen/perfil/minhas%20posicoes/cards_m_posicoes.dart';
import 'package:jjc/stores/userStore.dart';

import 'package:jjc/widgets/app_botton.dart';
import 'package:jjc/widgets/floatingActionButton/floatinAction_controller.dart';
import 'package:jjc/widgets/menuDrawer.dart';

class Mposicoes extends StatefulWidget {
  final url = Uri.parse(global.endereco + 'posicoes');

  @override
  _MposicoesState createState() => _MposicoesState();
}

class _MposicoesState extends State<Mposicoes> {

  var userStore =GetIt.I.get<UserStore>();

  @override
  Widget build(BuildContext context) {
    print(userStore.getMyTec());
    return Scaffold(
      endDrawer: global.token != '' ? menuDrawer() : null,
      appBar: AppBar(
        title: const Text('Meus Movimentos'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context)
              .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false),
        ),
      ),
      body: Container(
        child: Observer(builder: (_) => cardsMPosicoes(posicoes: userStore.getMyTec())),
      ),
      bottomNavigationBar: appBotton(
        cont: context,
        selectedIndex: 1,
      ),
    );
  }
}

