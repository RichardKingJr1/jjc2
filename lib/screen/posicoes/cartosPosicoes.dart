import 'dart:convert';

import 'package:flutter/material.dart';

class cartaoPosicao extends StatelessWidget {
  final dynamic posicoes;
  const cartaoPosicao({Key? key, required this.posicoes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (posicoes == null) {
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
                      Navigator.of(context)
                          .pushNamed('/aula', arguments: jsonEncode(posicoes[index]));
                    },
                    child: Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 15, top: 15),
                      child: Stack(children: [
                        Container(
                          child: Text(
                            posicoes[index]["nome"],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 25),
                          child: Row(children: [
                            Text(
                              posicoes[index]["nivel"],
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            Text(
                              ' - ' + posicoes[index]["sub"],
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
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
}
