import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class cartoes extends StatelessWidget {
  const cartoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String letra = '1';

    List itens = [
      {'index': '1', 'texto': AppLocalizations.of(context)!.guardaFechada},
      {'index': '2', 'texto': AppLocalizations.of(context)!.guardaAberta},
      {'index': '3', 'texto': AppLocalizations.of(context)!.passagemEmPe},
      {'index': '4', 'texto': AppLocalizations.of(context)!.meiaGuarda},
      {'index': '5', 'texto': AppLocalizations.of(context)!.cemkilos},
      {'index': '6', 'texto': AppLocalizations.of(context)!.montada},
      {'index': '7', 'texto': AppLocalizations.of(context)!.costas},
      {'index': '8', 'texto': AppLocalizations.of(context)!.norteSul},
      {'index': '9', 'texto': AppLocalizations.of(context)!.quedas}
    ];

    return ListView.builder(
      itemCount: itens.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 5),
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/imgs/' + itens[index]["index"] + '.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.6), BlendMode.darken)),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/posicoes',
                        arguments: itens[index]["index"]);
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                      itens[index]["texto"],
                      style: TextStyle(color: Colors.white, fontSize: 23),
                    ),
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
