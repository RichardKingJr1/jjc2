import 'package:flutter/material.dart';
import 'package:jjc/screen/widgets/app_botton.dart';
import 'package:jjc/screen/widgets/menuDrawer.dart';

class t_plans extends StatefulWidget {
  const t_plans({Key? key}) : super(key: key);

  @override
  _t_plansState createState() => _t_plansState();
}

class _t_plansState extends State<t_plans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: menuDrawer(),
      appBar: AppBar(
        title: const Text('Jiu Jitsu Club'),
      ),
      body: Container(
        //margin: const EdgeInsets.only(top: 5),
        child: cartoes(),
      ),
      bottomNavigationBar: appBotton(cont: context, selectedIndex: 0),
    );
  }

  Widget cartoes() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Text(
        "Sem Programas no momento",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
