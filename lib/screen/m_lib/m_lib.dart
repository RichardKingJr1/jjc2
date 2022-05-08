import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/screen/m_lib/cartoes_mlib.dart';
import 'package:jjc/stores/globalStore.dart';
import 'package:jjc/stores/userStore.dart';
import 'package:jjc/widgets/floatingActionButton/floatinAction_controller.dart';
import 'package:jjc/widgets/scaffoldStandart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MLib extends StatefulWidget {
  @override
  _MLibState createState() => _MLibState();
}

class _MLibState extends State<MLib> {

  var storeUser = GetIt.I.get<UserStore>();
  var storeGlobal = GetIt.I.get<GlobalStore>();
  
  @override
  Widget build(BuildContext context) {
    return ScaffoldStandart(
      bodyElement: Observer(builder: (_) => Cartoes_mlib(posicoes: storeUser.getPosicoes(storeGlobal.gi))),
      //bodyElement: Cartoes_mlib(posicoes: floatinAction_controller.instance.posicoes),
      titulo: AppLocalizations.of(context)!.meusMovimentos,
      index: 1,
      button: true,
    );
  }
}
