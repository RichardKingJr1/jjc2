import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jjc/global_services/global.dart' as global;

import 'package:jjc/screen/widgets/app_botton.dart';
import 'package:jjc/screen/widgets/menuDrawer.dart';

class MLib extends StatefulWidget {
  @override
  _MLibState createState() => _MLibState();
}

class _MLibState extends State<MLib> {
  List posicoes = global.myLib;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: menuDrawer(),
      appBar: AppBar(
        title: const Text('Meus Movimentos'),
      ),
      body: Container(
        child: cartoes(posicoes),
      ),
      bottomNavigationBar: appBotton(
        cont: context,
        selectedIndex: 1,
      ),
    );
  }
}

//Cartoes onde serão marcados os exercicios
Widget cartoes(posicoes) {
  if (posicoes == []) {
    return Text('Carregando');
  } else {
    return ListView.builder(
      itemCount: posicoes.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 5),
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: TextButton(
                  onPressed: () {
                    global.lib_carregada = global.myLib;
                    Navigator.of(context)
                        .pushNamed('/aula', arguments: index.toString());
                  },
                  child: Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 15, top: 15),
                    child: Stack(children: [
                      Container(
                        child: Text(
                          posicoes[index]["nome"],
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        child: Row(children: [
                          Text(
                            posicoes[index]["nivel"],
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          Text(
                            ' - ' + posicoes[index]["observacoes"],
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ]),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
