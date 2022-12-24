import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/screen/aula/widgets/contador_reps.dart';
import 'package:jjc/screen/aula/widgets/headerAula.dart';
import 'package:jjc/screen/aula/widgets/recomendacoes.dart';
import 'package:jjc/stores/globalStore.dart';
import 'package:jjc/stores/userStore.dart';
import 'package:jjc/widgets/scaffoldStandartBack.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:jjc/global_services/global.dart' as global;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Aula extends StatefulWidget {
  
  final url = Uri.parse(global.endereco + 'aula');

  dynamic aula = 0;

  var userStore = GetIt.I.get<UserStore>();
  var globalStore = GetIt.I.get<GlobalStore>();

  Aula(dynamic aula) {
    this.aula = jsonDecode(aula);
    globalStore.setExiste(false);
    
     
    if(globalStore.gi){
      globalStore.setIndex(userStore.user.myLib.indexWhere(
        (itemToCheck) {
          return  itemToCheck.id_posicao == this.aula['id_posicao'];
        },
      ));
    }else{
      globalStore.setIndex(userStore.user.myLibNogi.indexWhere(
        (itemToCheck) {
          return  itemToCheck.id_posicao == this.aula['id_posicao'];
        },
      ));
    }

    if (globalStore.index != -1) {
      globalStore.setExiste(true);
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
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  child: Observer(
                    builder: (context) {
                      return Column( 
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          headerAula(
                            nomeAula: aula_info['nome'],
                            //existe: widget.globalStore.existe,
                            aula: widget.aula,
                          ),
                          if(widget.globalStore.existe)
                            Contador(index: widget.globalStore.index, gi: widget.globalStore.gi),
                          SizedBox(height: 10),
                          Text(
                            aula_info['passo'] ?? '',
                            style: const TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Recomendações',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 2),
                          Recomendacoes(),
                        ],
                      );
                    }
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
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
        startAt: Duration(seconds: (int.parse(aula_info['inicio'] ?? '0'))),
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
      //log('Entered Fullscreen');
    };
    _controller.onExitFullscreen = () {
      //log('Exited Fullscreen');
    };
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
