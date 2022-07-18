import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/stores/userStore.dart';
import 'package:jjc/widgets/app_botton.dart';
import 'package:jjc/widgets/menuDrawer.dart';

class AddLib extends StatefulWidget {
  const AddLib({Key? key}) : super(key: key);

  @override
  _AddLibState createState() => _AddLibState();
}

class _AddLibState extends State<AddLib> {

  var userStore = GetIt.I.get<UserStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: userStore.token != '' ? menuDrawer() : null,
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
