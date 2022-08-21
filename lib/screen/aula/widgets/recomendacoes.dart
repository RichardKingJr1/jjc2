import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/stores/userStore.dart';

class Recomendacoes extends StatelessWidget {
  const Recomendacoes({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userStore = GetIt.I.get<UserStore>();

    return ListView.builder(
      primary: false,
      itemCount: 6, 
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        Random rnd = new Random();
        int r = rnd.nextInt(userStore.libCarregada.length);
        return TextButton(
          onPressed: () => Navigator.of(context).pushNamed('/aula', arguments: jsonEncode(userStore.libCarregada[r])),
          child: ListTile(
            minLeadingWidth : 10,
            leading: Container(
              padding: EdgeInsets.only(top: 10),
              child: Icon(Icons.brightness_1_outlined, size: 13, color: Colors.black,),
            ),
            title: Text(
              userStore.libCarregada[r]['nome'],
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              "${userStore.libCarregada[r]['nivel']} - ${userStore.libCarregada[r]['sub']}",  
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}