//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:jjc/global_services/global.dart' as global;
import 'package:jjc/widgets/app_botton.dart';
import 'package:jjc/widgets/floatingActionButton/floatingAction.dart';
import 'package:jjc/widgets/menuDrawer.dart';

class ScaffoldStandart extends StatelessWidget {
  Widget bodyElement;
  String titulo;
  int index;
  bool button;
  ScaffoldStandart({Key? key, required this.bodyElement, required this.titulo, required this.index, required this.button})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
      ),
      endDrawer: global.token != '' ? menuDrawer() : null,
      body: Container(
        //margin: const EdgeInsets.only(top: 5),
        child: bodyElement,
      ),
      bottomNavigationBar: appBotton(cont: context, selectedIndex: index),
      floatingActionButton:floating(button: button),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
