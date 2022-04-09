import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jjc/screen/widgets/app_botton.dart';
import 'package:jjc/screen/widgets/menuDrawer.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:jjc/global_services/global.dart' as global;
import 'package:http/http.dart' as http;

class mBibliotecas extends StatefulWidget {
  const mBibliotecas({Key? key}) : super(key: key);

  @override
  State<mBibliotecas> createState() => _mBibliotecasState();
}

class _mBibliotecasState extends State<mBibliotecas> {
  String biblioteca_id = '';

  //late TextEditingController _controller_biblioteca_id;
  TextEditingController _controller_biblioteca_id = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: global.token != '' ? menuDrawer() : null,
      appBar: AppBar(
        title: const Text('Meus Movimentos'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context)
              .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.only(left: 15, right: 15, top: 15),
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.number,
              controller: _controller_biblioteca_id,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                hintText: "Id Biblioteca",
                enabledBorder: const UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                ),
                border: UnderlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () => {
                    adicionar(),
                  },
                  icon: Icon(Icons.add),
                ),
              ),
              onChanged: (value) => setState(() => biblioteca_id = value),
              //onChanged: (value) => inicio = value,
            ),
          ),
          Expanded(
            child: Container(
              child: cartoes(global.agrupamento),
            ),
          ),
        ],
      ),
      bottomNavigationBar: appBotton(
        cont: context,
        selectedIndex: 1,
      ),
    );
  }

  //Cartoes onde serão marcados os exercicios
  Widget cartoes(bibliotecas) {
    if (bibliotecas == []) {
      return Text('Carregando');
    } else {
      return ListView.builder(
        itemCount: bibliotecas.length,
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
                      /* Navigator.of(context)
                          .pushNamed('/aula', arguments: jsonEncode(global.myLib[index])); */
                    },
                    child: Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(left: 15, top: 15),
                      child: Stack(children: [
                        Container(
                          child: Text(
                            bibliotecas[index],
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          ),
                        ),
                        Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.only(bottom: 15),
                            child: TextButton(
                              onPressed: () => {
                                apagar(index),
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.grey,
                                size: 30.0,
                              ),
                            )),
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

  Widget dialog(BuildContext context, msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: AlertDialog(
            title: Text(msg),
            actions: [
              Align(
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("ok")),
              )
            ],
          ),
        );
      },
    );
    return Text('dsfadsf');
  }

  adicionar() async {
    context.loaderOverlay.show();

    Map dataObj = {
      'email': global.globalVar['email'],
      'biblioteca_id': biblioteca_id,
    };

    await http
        .post(Uri.parse(global.endereco + 'adicionar_lib'),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(dataObj))
        .then(
          (response) => {
            if (response.statusCode == 200)
              {
                atualizar(),
                _controller_biblioteca_id.clear(),
                dialog(context, 'Lib Adicionada'),
              },
          },
        );
    context.loaderOverlay.hide();
  }

  apagar(index_biblioteca) async {
    context.loaderOverlay.show();

    //String S_dataObj = jsonEncode(dataObj);
    Map dataObj = {
      'email': global.globalVar['email'],
      'index': index_biblioteca,
    };

    await http
        .post(Uri.parse(global.endereco + 'excluir_lib'),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(dataObj))
        .then(
          (response) => {
            if (response.statusCode == 200)
              {
                atualizar(),
                dialog(context, 'Lib excluida'),
              },
          },
        );

    context.loaderOverlay.hide();
  }

  atualizar() async {
    Map dataObj = {'token': global.token, 'email': global.globalVar['email']};

    await http
        .post(Uri.parse(global.endereco + 'update_tec'),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(dataObj))
        .then((response) {
      dynamic data = json.decode(utf8.decode(response.bodyBytes));

      if (response.statusCode == 200) {
        //Fazer login no global service
        setState(() {
          global.agrupamento = (data['libs'] ?? []).cast<String>();
          global.agrupamento.add(dataObj['email']);
        });
      }
    });
  }
}
