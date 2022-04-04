import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:jjc/global_services/global.dart' as global;
import 'package:jjc/screen/posicoes/cartosPosicoes.dart';

import 'package:jjc/screen/widgets/scaffoldStandartBack.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Posicoes extends StatefulWidget {
  final String data;

  Posicoes({Key? key, required this.data}) : super(key: key);
  //final url = Uri.parse('http://10.0.2.2:4000/posicoes');
  final url = Uri.parse(global.endereco + 'posicoes');

  @override
  _PosicoesState createState() => _PosicoesState();
}

class _PosicoesState extends State<Posicoes> {
  dynamic posicoes;

  @override
  void initState() {
    getData();
    super.initState();
    context.loaderOverlay.show();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldStandartBack(
      titulo: AppLocalizations.of(context)!.posicoes,
      bodyElement: cartaoPosicao(posicoes: posicoes),
    );
  }

  void getData() async {
    Map dataObj = {
      'tec': widget.data,
      'agrupamento': global.agrupamento,
      'regiao': global.regiao
    };

    await http
        .post(widget.url,
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(dataObj))
        .then((response) {
      global.lib_carregada = jsonDecode(utf8.decode(response.bodyBytes));
      setState(() {
        posicoes = global.lib_carregada;
      });
    }).onError((error, stackTrace) {
      context.loaderOverlay.hide();
    });
    context.loaderOverlay.hide();
  }
}
