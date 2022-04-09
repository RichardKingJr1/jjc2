import 'dart:convert';

import 'package:flutter/material.dart';

class cartaoPosicao extends StatelessWidget {
  final dynamic posicoes;
  final dynamic subs;

  cartaoPosicao({Key? key, required this.posicoes, required this.subs}) :super(key: key);


  @override
  Widget build(BuildContext context) {
    if (posicoes == null) {
      return Text('Carregando');
    } else {
      return ListView.builder(
        itemCount: posicoes.length,
        itemBuilder: (BuildContext c, int i) {
          return ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(), 
              children: [
                Expanded(child: Container( 
                  decoration: const  BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey), 
                    ),
                  ),
                  //color: Colors.grey, 
                  child: Container(margin: EdgeInsets.only(left: 23, top: 10, bottom: 10), child: Text(subs[i], style: TextStyle(color: Colors.black, fontSize: 18))))
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: posicoes[i].length,
                    physics: ClampingScrollPhysics(), 
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 15),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              //height: 80,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed('/aula', arguments: jsonEncode(posicoes[i][index]));
                                },
                                child: Row(
                                  children: [
                                    Container(margin: EdgeInsets.only(right: 6, bottom: 22), child: Icon(Icons.brightness_1_outlined, size: 13, color: Colors.black,)),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      //margin: EdgeInsets.only(left: 15, top: 15),
                                      child: Stack(children: [
                                        Container(
                                          child: Text(
                                            posicoes[i][index]["nome"],
                                            //style: TextStyle(overflow: TextOverflow.ellipsis, color: Colors.black, fontSize: 16),
                                            style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.black, fontSize: 18),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 25),
                                          child: Row(children: [
                                            Text(
                                              posicoes[i][index]["nivel"],
                                              style:
                                                  TextStyle(color: Colors.grey, fontSize: 15),
                                            ),
                                            Text(
                                              ' - ' + posicoes[i][index]["sub"],
                                              style:
                                                  TextStyle(color: Colors.grey, fontSize: 15),
                                            ),
                                          ]),
                                        ),
                                      ]),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
      });
    }
  }
}



/*



*/ 