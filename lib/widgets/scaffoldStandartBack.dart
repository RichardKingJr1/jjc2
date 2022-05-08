//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/global_services/global.dart' as global;
import 'package:jjc/stores/userStore.dart';

import 'package:jjc/widgets/menuDrawer.dart';
import 'package:jjc/widgets/app_botton.dart';

class ScaffoldStandartBack extends StatelessWidget {
  final Widget bodyElement;
  final String titulo;
  ScaffoldStandartBack(
      {Key? key, required this.bodyElement, required this.titulo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    var userStore = GetIt.I.get<UserStore>();

    return Observer(builder: (_){
      return Scaffold(
      endDrawer: userStore.token != '' ? const menuDrawer() : null,
      appBar: AppBar(
        title: Text(titulo),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        //margin: const EdgeInsets.only(top: 5),
        child: bodyElement,
      ),
      bottomNavigationBar: appBotton(cont: context, selectedIndex: 0),
    );
    });
  }
}
