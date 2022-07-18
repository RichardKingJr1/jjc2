import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/global_services/global.dart' as global;
import 'package:jjc/screen/aula/headerAula_controller.dart';
import 'package:jjc/stores/globalStore.dart';
import 'package:jjc/stores/userStore.dart';
import 'package:jjc/widgets/dropDownsValues.dart';

class Cartoes_mlib extends StatelessWidget {
  final posicoes;
  Cartoes_mlib({ Key? key, required this.posicoes }) : super(key: key);

  var dropDowns = DropDownValue();

  var globalStore = GetIt.I.get<GlobalStore>();
  var userStore = GetIt.I.get<UserStore>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: headerAula_controller.instance.existe, builder: (context, value, child){

      Map faixa = dropDowns.getFaixa(context);
      Map subdiv = dropDowns.getSub(context);

      return ListView.builder(
      itemCount: posicoes.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
              margin: const EdgeInsets.only(bottom: 5),
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: TextButton(
                onPressed: () {
                  if(globalStore.gi){
                    userStore.setLibCarregada(userStore.user.myLib);
                  }else{
                    userStore.setLibCarregada(userStore.user.myLibNogi);
                  }
                  Navigator.of(context)
                      .pushNamed('/aula', arguments: jsonEncode(userStore.libCarregada[index]));
                },
                child: Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 15, top: 15),
                  child: Stack(children: [
                    Container(
                      child: Text(
                        posicoes[index]["nome"],
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.black, fontSize: 18),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      child: Row(children: [
                        Text(
                          faixa[posicoes[index]["nivel"]],
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        Text(
                          ' - ' + subdiv[posicoes[index]["sub"]],
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ]),
                    ),
                  ]),
                ),
              ),
            );
      },
    );
    });
  }
}