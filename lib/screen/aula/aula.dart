import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter/services.dart';
import 'package:jjc/screen/widgets/menuDrawer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:jjc/global_services/global.dart' as global;

import 'package:jjc/screen/widgets/app_botton.dart';

class Aula extends StatefulWidget {
  //final url = Uri.parse('http://10.0.2.2:4000/aula');
  //final url1 = Uri.parse('http://10.0.2.2:4000/add_lib');

  final url = Uri.parse(global.endereco + 'aula');
  final url1 = Uri.parse(global.endereco + 'add_to_lib');

  int index_posicao = 0;
  bool existe = false;

  //Aula({Key? key, required this.index_posicao}) : super(key: key);

  Aula(String index_posicao) {
    this.index_posicao = int.parse(index_posicao);

    dynamic teste = global.myLib.firstWhere(
        (itemToCheck) =>
            itemToCheck['id_posicao'] ==
            global.lib_carregada[this.index_posicao]['id_posicao'],
        orElse: () => false);

    if (teste != false) {
      existe = true;
    }
  }

  @override
  _AulaState createState() => _AulaState();
}

class _AulaState extends State<Aula> {
  late YoutubePlayerController _controller;
  dynamic aula_info;

  dynamic index_int = 1;

  //String id = 'ZnevdXDH25Q';

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  //widget com um controle de dados e um controle da view horizontal ou vertical para controlar o appbar
  Widget build(BuildContext context) {
    if (aula_info == null) {
      return Text('Carregando');
    } else {
      return OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
        if (orientation == Orientation.landscape) {
          return WillPopScope(
            onWillPop: () async {
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
              ]);
              return true;
            },
            child: Scaffold(
              body: corpoElemento2(),
            ),
          );
        } else {
          return Scaffold(
            endDrawer: menuDrawer(),
            appBar: AppBar(
              title: Text('Aula'),
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: corpoElemento1(),
            bottomNavigationBar: appBotton(cont: context, selectedIndex: 0),
          );
        }
      });
    }
  }

  //Body do elemento
  Container corpoElemento1() {
    return Container(
        child: Column(
      children: [
        YoutubePlayer(controller: _controller),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: Text(
                        aula_info['nome'],
                        style: TextStyle(color: Colors.black, fontSize: 21),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(child: () {
                        if (!widget.existe & global.globalVar['logado'] ==
                            true) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size.fromHeight(40)),
                            // fromHeight use double.1infinity as width and 40 is the height
                            child: Text('+'),
                            onPressed: () => adicionarPosicao(),
                          );
                        } else {
                          return null;
                        }
                      }()),
                    ),
                  ],
                ),
              ),
              Text(
                aula_info['passo'] ?? '',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ],
          ),
        )
      ],
    ));
  }

  //Body do elemento
  Container corpoElemento2() {
    return Container(
        child: Center(child: YoutubePlayer(controller: _controller)));
  }

  dynamic getData() async {
    setState(() {
      aula_info = global.lib_carregada[widget.index_posicao];
      runYoutubePlayer();
    });
  }

  dynamic adicionarPosicao() async {
    Map dataObj = global.lib_carregada[widget.index_posicao];
    dataObj['email'] = global.globalVar['email'];

    await http
        .post(widget.url1,
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(dataObj))
        .then((response) {
      print(response.body);
      setState(() {
        global.myLib.add(global.lib_carregada[widget.index_posicao]);
        widget.existe = true;
      });
    });
  }

  void runYoutubePlayer() {
    print(aula_info['idVideo']);
    _controller = YoutubePlayerController(
      initialVideoId: aula_info['idVideo'],
      //initialVideoId: '1',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        startAt: int.parse(aula_info['inicio']),
        endAt: int.parse(aula_info['fim']),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
