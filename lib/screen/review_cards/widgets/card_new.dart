import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/models/aula_model.dart';
import 'package:jjc/screen/review_cards/reviewStore.dart';

class CardWidget extends StatefulWidget {
  final AulaModel aula;
  final bool isFront;

  const CardWidget({
    required this.aula,
    Key? key, 
    required this.isFront,
  }) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  var reviewStore = GetIt.I.get<ReviewStore>();

  @override
  Widget build(BuildContext context) {
    //final swipingDirection = provider.swipingDirection
    final size = MediaQuery.of(context).size;
    return widget.isFront? buildFrontCard(context, size) : buildCard(size);
  }

  Widget buildFrontCard(BuildContext context, Size size){

    return GestureDetector(
      child:  LayoutBuilder(
        builder: (context, constraints) {
          return Observer(
            builder: (context) {

              final position = reviewStore.position;
              final miliseconds = reviewStore.isDraggin ? 0 : 400;

              final center = constraints.smallest.center(Offset.zero);
              final angle = reviewStore.angle * pi / 600;
              final rotatedMatrix = Matrix4.identity()
              ..translate(-center.dx, -center.dy)
              ..rotateZ(angle)
              ..translate(center.dx, center.dy);

              return Container(
                child: AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: Duration(microseconds: miliseconds),
                  transform: rotatedMatrix..translate(position.dx, position.dy),
                  child: Container(
                    height: size.height * 0.8,
                    width: size.width * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        //image: AssetImage(aula.idVideo ?? ''),
                        image: NetworkImage(widget.aula.idVideo ?? ""),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, spreadRadius: 0.5),
                        ],
                        gradient: LinearGradient(
                          colors: [Colors.black12, Colors.black87],
                          begin: Alignment.center,
                          stops: [0.4, 1],
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 10,
                            left: 10,
                            bottom: 10,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildUserInfo(aula: widget.aula),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 16, right: 8),
                                  child: Icon(Icons.info, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          //if (isUserInFocus) buildLikeBadge(swipingDirection)
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          );
        },
      ),
      onPanStart: (details) {
      reviewStore.startPosition(details);
      },
      onPanUpdate: (details) {
        reviewStore.updatePosition(details);
      },
      onPanEnd: (_) {
        reviewStore.endPosition();
      },
    );
  }

  Widget buildLikeBadge() {
    return Container();
    /* final isSwipingRight = swipingDirection == SwipingDirection.right;
    final color = isSwipingRight ? Colors.green : Colors.pink;
    final angle = isSwipingRight ? -0.5 : 0.5;

    if (swipingDirection == SwipingDirection.none) {
      return Container();
    } else {
      return Positioned(
        top: 40,
        right: isSwipingRight ? null : 30,
        left: isSwipingRight ? 30 : null,
        child: Transform.rotate(
          angle: angle,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: color, width: 2),
            ),
            child: Text(
              isSwipingRight ? 'LIKE' : 'NOPE',
              style: TextStyle(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    } */
  }

  Widget buildUserInfo({required AulaModel aula}) => Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${aula.nome}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '${aula.id_posicao} - ${aula.sub}',
              style: TextStyle(color: Colors.white),
            ),
            /* SizedBox(height: 4),
            Text(
              '${aula.observacoes}',
              style: TextStyle(color: Colors.white),
            ) */
          ],
        ),
      );

  Widget buildCard(Size size) {
    return Container(
      height: size.height * 0.8,
      width: size.width * 0.95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          //image: AssetImage(aula.idVideo ?? ''),
          image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/220px-Image_created_with_a_mobile_phone.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 0.5),
          ],
          gradient: LinearGradient(
            colors: [Colors.black12, Colors.black87],
            begin: Alignment.center,
            stops: [0.4, 1],
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 10,
              left: 10,
              bottom: 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildUserInfo(aula: widget.aula),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16, right: 8),
                    child: Icon(Icons.info, color: Colors.white),
                  )
                ],
              ),
            ),
            //if (isUserInFocus) buildLikeBadge(swipingDirection)
          ],
        ),
      ),
    );
  }
}