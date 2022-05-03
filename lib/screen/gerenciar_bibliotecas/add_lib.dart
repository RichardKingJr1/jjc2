import 'package:flutter/material.dart';
import 'package:jjc/widgets/app_botton.dart';
import 'package:jjc/widgets/menuDrawer.dart';

import 'package:jjc/global_services/global.dart' as global;

class addLib extends StatefulWidget {
  const addLib({Key? key}) : super(key: key);

  @override
  _addLibState createState() => _addLibState();
}

class _addLibState extends State<addLib> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: global.token != '' ? menuDrawer() : null,
      appBar: AppBar(
        title: const Text('Adicionar Técnica'),
      ),
      body: Container(),
      bottomNavigationBar: appBotton(
        cont: context,
        selectedIndex: 2,
      ),
    );
  }
}
