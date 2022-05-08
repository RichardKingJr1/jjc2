import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/screen/atualize/atualiza.dart';
import 'package:jjc/screen/home/cartoes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jjc/stores/globalStore.dart';
import 'package:jjc/widgets/floatingActionButton/floatinAction_controller.dart';
import 'package:jjc/widgets/scaffoldStandart.dart'; // important
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  //const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //List<Widget> cards = new List.generate(20, (i) => new Cartoes()).toList();

  //var globalStore = GetIt.I.get<GlobalStore>();

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