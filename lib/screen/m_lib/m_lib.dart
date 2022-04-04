import 'package:flutter/material.dart';
import 'package:jjc/global_services/global.dart' as global;
import 'package:jjc/screen/m_lib/cartoes_mlib.dart';
import 'package:jjc/screen/widgets/scaffoldStandart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MLib extends StatefulWidget {
  @override
  _MLibState createState() => _MLibState();
}

class _MLibState extends State<MLib> {
  List posicoes = global.myLib;
  @override
  Widget build(BuildContext context) {
    return ScaffoldStandart(
      bodyElement: Cartoes_mlib(posicoes: posicoes),
      titulo: AppLocalizations.of(context)!.meusMovimentos,
      index: 1,
      button: true,
    );
  }
}
