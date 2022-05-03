import 'package:flutter/material.dart';
import 'package:jjc/global_services/global.dart' as global;
import 'package:jjc/screen/perfil/minhas%20posicoes/cards_m_posicoes.dart';

import 'package:jjc/widgets/app_botton.dart';
import 'package:jjc/widgets/floatingActionButton/floatinAction_controller.dart';
import 'package:jjc/widgets/menuDrawer.dart';

class Mposicoes extends StatefulWidget {
  final url = Uri.parse(global.endereco + 'posicoes');

  @override
  _MposicoesState createState() => _MposicoesState();
}

class _MposicoesState extends State<Mposicoes> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: floatinAction_controller.instance.propTec, builder: (context, value, child){
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
          child: cardsMPosicoes(posicoes: global.prop_tec),
        ),
        bottomNavigationBar: appBotton(
          cont: context,
          selectedIndex: 1,
        ),
      );
    });
  }
}

