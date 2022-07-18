import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/stores/userStore.dart';

class CardsMPosicoes extends StatelessWidget {
  
  final List posicoes;
  CardsMPosicoes({ Key? key, required this.posicoes }) : super(key: key);

  final userStore =GetIt.I.get<UserStore>();

  @override
  Widget build(BuildContext context) {
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
                height: 75,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed('/aula', arguments: jsonEncode(userStore.user.prop_tec[index]));
                  },
                  child: Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 15, top: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Stack(children: [
                            Container(
                              child: Text(
                                posicoes[index]["nome"],
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
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
                                  ' - ' + posicoes[index]["sub"],
                                  style: TextStyle(color: Colors.grey, fontSize: 15),
                                ),
                              ]),
                            ),
                          ]),
                        ),
                        Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.only(bottom: 15),
                            child: TextButton(
                              onPressed: () => {
                                Navigator.of(context).pushNamed('/editor',
                                    arguments: index.toString())
                              },
                              child: Icon(
                                Icons.settings,
                                color: Colors.grey,
                                size: 30.0,
                              ),
                            )
                        ),
                      ],
                    ),
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
}