import 'package:flutter/material.dart';
import 'package:jjc/main.dart';
import 'package:jjc/screen/widgets/scaffoldStandartBack.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Idioma extends StatefulWidget {
  const Idioma({Key? key}) : super(key: key);

  @override
  State<Idioma> createState() => _IdiomaState();
}

class _IdiomaState extends State<Idioma> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldStandartBack(
      titulo: AppLocalizations.of(context)!.idioma,
      bodyElement: const CartoesIdiomas(),
    );
  }
}


class CartoesIdiomas extends StatelessWidget {
  const CartoesIdiomas({ Key? key }) : super(key: key);

  static const idiomas_lib = [
    {'nome': 'Portugues', 'codigo': 'pt'},
    {'nome': 'Ingles', 'codigo': 'en'}
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: idiomas_lib.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 5),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: TextButton(
                  onPressed: () {
                    MyApp.setLocale(context, Locale(idiomas_lib[index]['codigo']!));
                    Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                  },
                  child: Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 15, top: 5),
                    child: Stack(children: [
                      Container(
                        child: Text(
                          idiomas_lib[index]['nome']!,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black, fontSize: 18),
                        ),
                      ),
                      /* Container(
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
                          )), */
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