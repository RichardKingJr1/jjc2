import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/models/aula_model.dart';
import 'package:jjc/screen/review_cards/reviewStore.dart';
import 'package:jjc/screen/review_cards/widgets/card_new.dart';
import 'package:jjc/widgets/scaffoldStandart.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter/services.dart';

class ReviewCard extends StatefulWidget {
  const ReviewCard({Key? key}) : super(key: key);

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {

  late YoutubePlayerController _controller;
  var reviewStore = GetIt.I.get<ReviewStore>();

  @override
  void initState() {
    super.initState();
    getData();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final Size size = MediaQuery.of(context).size;
      reviewStore.setScreenSize(size);
    });
  }

  getData() async {
    setState(() {
      playerRun();
    });
  }

  playerRun() {
    _controller = YoutubePlayerController(
      //initialVideoId: aula_info['idVideo'],
      initialVideoId: '1',
      params: const YoutubePlayerParams(
        //startAt: Duration(seconds: (int.parse(aula_info['inicio'] ?? '0'))),
        startAt: Duration(seconds: 0),
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
    };
    _controller.onExitFullscreen = () {
    };
  }


  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();
    return YoutubePlayerControllerProvider(
      // Passing controller to widgets below.
      controller: _controller,
      child: ScaffoldStandart(
        //bodyElement: Stack(children: reviewStore.aulas.map(buildCard).toList()),
        bodyElement: buildCard(),
        titulo: "JJC",
        index: 2,
    ));
  } 

  Widget buildCard()  {
    List<AulaModel> aulas = reviewStore.aulas;
    return Stack(
      children: aulas.map((aula) {
        return Center(
          child: CardWidget(
            aula: aula,
            isFront: aulas.last == aula
          ),
        );
      }).toList(),
    );

  }
}