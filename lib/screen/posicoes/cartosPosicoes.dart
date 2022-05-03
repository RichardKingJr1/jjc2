import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jjc/screen/widgets/floatingActionButton/floatinAction_controller.dart';


class cartaoPosicao extends StatelessWidget {
  final dynamic posicoes;
  final dynamic subs;

  cartaoPosicao({Key? key, required this.posicoes, required this.subs}) :super(key: key);


  @override
  Widget build(BuildContext context) {
    Map faixa = floatinAction_controller.instance.getFaixa(context);
    Map subdiv = floatinAction_controller.instance.getSub(context);

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
              Container( 
                decoration: const  BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey), 
                  ),
                ),
                //color: Colors.grey, 
                child: Container(
                  margin: EdgeInsets.only(left: 23, top: 10, bottom: 10), 
                  child: Text(subdiv[subs[i]], style: TextStyle(color: Colors.black, fontSize: 18))),
              ),
              ListView.builder(
                itemCount: posicoes[i].length,
                physics: ClampingScrollPhysics(), 
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return 
                     TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed('/aula', arguments: jsonEncode(posicoes[i][index]));
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 27, top: 12, bottom: 12, right: 15),
                        child: Row(children: [
                          Container(margin: EdgeInsets.only(right: 6, bottom: 22), child: Icon(Icons.brightness_1_outlined, size: 13, color: Colors.black,)),
                          Flexible(
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
                                    faixa[posicoes[i][index]["nivel"]],
                                    style:
                                        TextStyle(color: Colors.grey, fontSize: 15),
                                  ),
                                  Text(
                                    ' - ' + subdiv[posicoes[i][index]["sub"]],
                                    style:
                                        TextStyle(color: Colors.grey, fontSize: 15),
                                  ),
                                ]),
                              ),
                            ]),
                          )
                        ]),
                      ),
                    );

                },
              ),
            ],
          );
      });
    }
  }
}