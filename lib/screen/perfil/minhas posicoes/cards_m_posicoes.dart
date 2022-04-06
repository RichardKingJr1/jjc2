import 'package:flutter/material.dart';
import 'package:jjc/global_services/global.dart' as global;
import 'package:jjc/screen/posicoes/posicoes.dart';

class cardsMPosicoes extends StatelessWidget {
  
  final List posicoes;
  const cardsMPosicoes({ Key? key, required this.posicoes }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (posicoes == []) {
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
                height: 75,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: TextButton(
                  onPressed: () {
                    global.lib_carregada = global.prop_tec;
                    Navigator.of(context)
                        .pushNamed('/aula', arguments: index.toString());
                  },
                  child: Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 15, top: 5),
                    child: Stack(children: [
                      Container(
                        padding: const EdgeInsets.only(right: 55),
                        child: Text(
                          posicoes[index]["nome"],
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black, fontSize: 18),
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
                      Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(bottom: 15),
                          child: TextButton(
                            onPressed: () => {
                              Navigator.of(context).pushNamed('/editor',
                                  arguments: index.toString())
                            },
                            child: Icon(
                              Icons.settings,
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
}