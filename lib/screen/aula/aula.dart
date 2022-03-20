import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter/services.dart';
import 'package:jjc/screen/widgets/menuDrawer.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'package:http/http.dart' as http;
import 'package:jjc/global_services/global.dart' as global;

import 'package:jjc/screen/widgets/app_botton.dart';

import 'dart:developer';
import 'package:flutter/foundation.dart';

class Aula extends StatefulWidget {
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

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();
    return YoutubePlayerControllerProvider(
      // Passing controller to widgets below.
      controller: _controller,
      child: Scaffold(
        endDrawer: menuDrawer(),
        appBar: AppBar(
          title: Text('Aula'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: corpoElemento1(player),
        bottomNavigationBar: appBotton(cont: context, selectedIndex: 0),
      ),
    );
  }

  //Body do elemento
  Container corpoElemento1(player) {
    return Container(
        child: Column(
      children: [
        player,
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

  dynamic getData() async {
    setState(() {
      aula_info = global.lib_carregada[widget.index_posicao];
      playerRun();
    });
  }

  playerRun() {
    _controller = YoutubePlayerController(
      initialVideoId: aula_info['idVideo'],
      params: YoutubePlayerParams(
        startAt: Duration(seconds: (int.parse(aula_info['inicio']))),
        showControls: true,
        showFullscreenButton: true,
        desktopMode: false,
        privacyEnhanced: true,
        useHybridComposition: true,
      ),
    );
    _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      log('Entered Fullscreen');
    };
    _controller.onExitFullscreen = () {
      log('Exited Fullscreen');
    };
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
