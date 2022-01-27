import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jjc/global_services/global.dart' as global;

import 'package:jjc/screen/widgets/app_botton.dart';
import 'package:jjc/screen/widgets/menuDrawer.dart';
import 'package:loader_overlay/loader_overlay.dart';

class Posicoes extends StatefulWidget {
  final String data;

  Posicoes({Key? key, required this.data}) : super(key: key);
  //final url = Uri.parse('http://10.0.2.2:4000/posicoes');
  final url = Uri.parse(global.endereco + 'posicoes');

  @override
  _PosicoesState createState() => _PosicoesState();
}

class _PosicoesState extends State<Posicoes> {
  dynamic posicoes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: menuDrawer(),
      appBar: AppBar(
        title: const Text('Posicoes'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        child: cartoes(posicoes, context),
      ),
      bottomNavigationBar: appBotton(cont: context, selectedIndex: 0),
    );
  }

  @override
  void initState() {
    getData();
    super.initState();
    context.loaderOverlay.show();
  }

  void getData() async {
    /* Map dataObj = {'id': ''};
    dataObj['id'] = widget.data; */

    Map dataObj = {
      'tec': widget.data,
      'agrupamento': global.agrupamento,
      'regiao': global.regiao
    };

    await http
        .post(widget.url,
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(dataObj))
        .then((response) {
      global.lib_carregada = jsonDecode(utf8.decode(response.bodyBytes));
      setState(() {
        posicoes = global.lib_carregada;
      });
    }).onError((error, stackTrace) {
      context.loaderOverlay.hide();
    });
    context.loaderOverlay.hide();
  }
}

//Cartoes onde serão marcados os exercicios
Widget cartoes(posicoes, cont) {
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
                        .pushNamed('/aula', arguments: index.toString());
                  },
                  child: Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 15, top: 15),
                    child: Stack(children: [
                      Container(
                        child: Text(
                          posicoes[index]["nome"],
                          style: TextStyle(color: Colors.black, fontSize: 18),
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
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
