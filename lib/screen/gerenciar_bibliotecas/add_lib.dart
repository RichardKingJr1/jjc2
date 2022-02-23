import 'package:flutter/material.dart';
import 'package:jjc/screen/widgets/app_botton.dart';
import 'package:jjc/screen/widgets/menuDrawer.dart';

class addLib extends StatefulWidget {
  const addLib({Key? key}) : super(key: key);

  @override
  _addLibState createState() => _addLibState();
}

class _addLibState extends State<addLib> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      endDrawer: menuDrawer(),
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
