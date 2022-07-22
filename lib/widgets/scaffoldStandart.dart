//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/stores/userStore.dart';
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
    
    var userStore = GetIt.I.get<UserStore>();
    
    return Observer(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: Text(titulo),
        ),
        endDrawer: userStore.token != '' ? menuDrawer() : null,
        body: Container(
          //margin: const EdgeInsets.only(top: 5),
          child: bodyElement,
        ),
        bottomNavigationBar: appBotton(cont: context, selectedIndex: index),
        floatingActionButton:floating(button: button),
        //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      );
    });
  }
}
