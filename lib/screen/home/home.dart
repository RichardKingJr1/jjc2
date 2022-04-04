import 'package:flutter/material.dart';
import 'package:jjc/screen/home/cartoes.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jjc/screen/widgets/scaffoldStandart.dart'; // important

class Home extends StatefulWidget {
  //const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //List<Widget> cards = new List.generate(20, (i) => new Cartoes()).toList();

  @override
  Widget build(BuildContext context) {
    return ScaffoldStandart(
      bodyElement: const cartoes(),
      titulo: AppLocalizations.of(context)!.tituloHome,
      index: 0,
      button: true,
    );
  }
}
