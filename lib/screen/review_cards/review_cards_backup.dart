/* import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/models/aula_model.dart';
import 'package:jjc/screen/review_cards/reviewStore.dart';
import 'package:jjc/screen/review_cards/widgets/card_new.dart';
import 'package:jjc/widgets/scaffoldStandart.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';




class CardsReviewBackUp extends StatefulWidget {
  const CardsReviewBackUp({ Key? key }) : super(key: key);

  @override
  State<CardsReviewBackUp> createState() => _CardsReviewBackUpState();
}

class _CardsReviewBackUpState extends State<CardsReviewBackUp> {
  late YoutubePlayerController _controller;
  //CardController cardController = CardController();
  var reviewStore = GetIt.I.get<ReviewStore>();

  @override
  void initState() {
    super.initState();
    getData();
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
        bodyElement: Stack(children: reviewStore.aulas.map(buildCard).toList()),
        titulo: "JJC",
        index: 2,
    ));
  } 

  Widget buildCard(AulaModel aula) {
    final userIndex = reviewStore.aulas.indexOf(aula);
    final isUserInFocus = userIndex == reviewStore.aulas.length - 1;
    
    
    return Listener(
      child: Center(
        child: Draggable(
          feedback: Material(
            type: MaterialType.transparency,
            child: CardWidget(aula: aula),
          ),
          child: CardWidget(aula: aula),
          childWhenDragging: Container(),
            onDragEnd: (details) => reviewStore.onDragEnd(details, aula),
          ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  } 
}
 */

/* return Container(
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
                          /* headerAula(
                            nomeAula: aula_info['nome'],
                            //existe: widget.globalStore.existe,
                            aula: widget.aula,
                          ), */
                          /* if(widget.globalStore.existe)
                            Contador(index: widget.globalStore.index, gi: widget.globalStore.gi), */
                          SizedBox(height: 10),
                          /* Text(
                            aula_info['passo'] ?? '',
                            style: const TextStyle(color: Colors.black, fontSize: 15),
                          ), */
                          SizedBox(height: 15),
                          Text(
                            'Recomendações',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 2),
                          //Recomendacoes(),
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
    ); */