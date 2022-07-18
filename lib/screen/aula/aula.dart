import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/screen/aula/headerAula.dart';
import 'package:jjc/stores/globalStore.dart';
import 'package:jjc/stores/userStore.dart';
import 'package:jjc/widgets/scaffoldStandartBack.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:jjc/global_services/global.dart' as global;
import 'dart:developer';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Aula extends StatefulWidget {
  
  final url = Uri.parse(global.endereco + 'aula');

  dynamic aula = 0;
  bool existe = false;

  var userStore = GetIt.I.get<UserStore>();
  var globalStore = GetIt.I.get<GlobalStore>();

  Aula(dynamic aula) {
    this.aula = jsonDecode(aula);

    dynamic teste;
     
    if(globalStore.gi){
      teste = userStore.user.myLib.firstWhere(
        (itemToCheck) =>
            itemToCheck['id_posicao'] ==
            this.aula['id_posicao'],
        orElse: () => false);
    }else{
      teste = userStore.user.myLibNogi.firstWhere(
        (itemToCheck) =>
            itemToCheck['id_posicao'] ==
            this.aula['id_posicao'],
        orElse: () => false);
    }

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
        child: ScaffoldStandartBack(
          bodyElement: corpoElemento1(player),
          titulo: AppLocalizations.of(context)!.aula,
        ));
  }

  //Body do elemento
  Container corpoElemento1(player) {
    return Container(
        child: Column(
      children: [
        player,
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
          child: Column(
            children: [
              headerAula(
                nomeAula: aula_info['nome'],
                existe: widget.existe,
                aula: widget.aula,
              ),
              //contador(reps: aula_info['reps'] ?? 0),
              Text(
                aula_info['passo'] ?? '',
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
            ],
          ),
        ),
        //contador(),
      ],
    ));
  }

  dynamic getData() async {
    setState(() {
      aula_info = widget.aula;
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
