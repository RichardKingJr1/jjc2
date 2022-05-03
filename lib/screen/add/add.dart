import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jjc/global_services/global.dart' as global;

import 'package:jjc/screen/widgets/alertDialog.dart';
import 'package:jjc/screen/widgets/scaffoldStandart.dart';

import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class addPosicao extends StatefulWidget {
  //final url = Uri.parse('http://10.0.2.2:4000/criar_conta');
  final url = Uri.parse(global.endereco + 'add_tec');

  addPosicao({Key? key}) : super(key: key);

  @override
  _addPosicaoState createState() => _addPosicaoState();
}

class _addPosicaoState extends State<addPosicao> {
  String nome = '';
  String idVideo = "";
  String tec = '1';
  String sub = "Outra";
  String nivel = "Branca";
  String observacoes = "";
  String inicio = "0";
  String fim = "0";
  String passo = "";
  String gi = "";

  TextEditingController _controller_nome = TextEditingController();
  TextEditingController _controller_id = TextEditingController();
  TextEditingController _controller_agrupamento = TextEditingController();
  TextEditingController _controller_nivel = TextEditingController();
  TextEditingController _controller_observacoes = TextEditingController();
  TextEditingController _controller_inicio = TextEditingController();
  TextEditingController _controller_fim = TextEditingController();
  TextEditingController _controller_passo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldStandart(
      bodyElement: addTec(),
      titulo: AppLocalizations.of(context)!.addTec,
      index: 2,
      button: false,
    );
  }

  Widget addTec() {
    return Container(
      child: Material(
        child: SafeArea(
          child: Container(
            //alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                inputDefault(
                  const EdgeInsets.only(top: 20, bottom: 20),
                  AppLocalizations.of(context)!.nomeTec,
                  _controller_nome,
                  (value) => setState(() => nome = value),
                ),
                inputDefault(
                  const EdgeInsets.only(bottom: 20),
                  AppLocalizations.of(context)!.idTec,
                  _controller_id,
                  (value) => setState(() => idVideo = value),
                ),
                inputDefault(
                  const EdgeInsets.only(bottom: 20),
                  AppLocalizations.of(context)!.observacoesTec,
                  _controller_observacoes,
                  (value) => observacoes = value,
                ),
                inputDefault(
                  const EdgeInsets.only(bottom: 20),
                  AppLocalizations.of(context)!.inicioTec,
                  _controller_inicio,
                  (value) => inicio = value,
                ),
                /* Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _controller_fim,
                      decoration: InputDecoration(
                        hintText: "Fim do Video Segundos",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => fim = value,
                    ),
                  ), */
                seletor(dropDown_gi()),
                seletor(dropDown_agrupamento()),
                seletor(dropDown_nivel()),
                seletor(dropDown_sub()),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    maxLines: 8,
                    controller: _controller_passo,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.passoTec,
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (value) => passo = value,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(400, 65)),
                    // fromHeight use double.infinity as width and 40 is the height
                    child: Text(AppLocalizations.of(context)!.addTec),
                    onPressed: () => submit(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submit() async {

    if(nome != '' && idVideo != ''){
      Map dataObj = {
        'nome': nome,
        'idVideo': idVideo,
        'agrupamento': global.globalVar['email'],
        'nivel': nivel,
        'observacoes': observacoes,
        'inicio': inicio,
        'fim': fim,
        'sub': sub,
        'regiao': global.regiao,
        'tec': tec,
        'passo': passo,
        'gi': gi
      };

      context.loaderOverlay.show();

      //String S_dataObj = jsonEncode(dataObj);

      await http
          .post(widget.url,
              headers: {"Content-Type": "application/json"},
              body: jsonEncode(dataObj))
          .then((response) {
        if (response.statusCode == 200) {
          setState(() {
            Dialogs.alerta(context, AppLocalizations.of(context)!.alertaTecAdd, "Ok");
            _controller_nome.clear();
            _controller_id.clear();
            _controller_agrupamento.clear();
            _controller_inicio.clear();
            _controller_fim.clear();
            _controller_nivel.clear();
            _controller_observacoes.clear();
            _controller_passo.clear();
          });
        }
      });

      context.loaderOverlay.hide();
      atualizar();
    }else{
      Dialogs.alerta(context, AppLocalizations.of(context)!.alertaPreencha, "Ok");
    }

    
  }

  atualizar() async {
    print('atualizar');
    Map dataObj = {'token': global.token, 'email': global.globalVar['email']};

    await http
        .post(Uri.parse(global.endereco + 'update_tec'),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(dataObj))
        .then((response) {
      dynamic data = json.decode(utf8.decode(response.bodyBytes));

      if (response.statusCode == 200) {
        //Fazer login no global service
        //global.myLib = data['user']['m_tec'];
        global.prop_tec = data['prop_tec'];
      }
    });
  }

  /* DropsDowns */

  Widget dropDown_gi() {
    return DropdownButton<String>(
      value: gi,
      icon: const Icon(Icons.arrow_downward),
      style: const TextStyle(color: Color(2583691263)),
      underline: Container(
        height: 1,
        color: Color(2583691263),
      ),
      onChanged: (String? newValue) {
        setState(() {
          gi = newValue!;
        });
      },
      items: [
        {'nome': 'GI', 'valor': ''},
        {'nome': 'NOGI', 'valor': '-nogi'},
      ].map<DropdownMenuItem<String>>((Map value) {
        return DropdownMenuItem<String>(
          value: value['valor'],
          child: Text(value['nome']),
        );
      }).toList(),
    );
  }

  Widget dropDown_agrupamento() {
    return DropdownButton<String>(
      value: tec,
      icon: const Icon(Icons.arrow_downward),
      style: const TextStyle(color: Color(2583691263)),
      underline: Container(
        height: 1,
        color: Color(2583691263),
      ),
      onChanged: (String? newValue) {
        setState(() {
          tec = newValue!;
        });
      },
      items: [
        {'nome': AppLocalizations.of(context)!.guardaFechada, 'valor': '1'},
        {'nome': AppLocalizations.of(context)!.guardaAberta, 'valor': '2'},
        {'nome': AppLocalizations.of(context)!.passagemEmPe, 'valor': '3'},
        {'nome': AppLocalizations.of(context)!.meiaGuarda, 'valor': '4'},
        {'nome': AppLocalizations.of(context)!.cemkilos, 'valor': '5'},
        {'nome': AppLocalizations.of(context)!.montada, 'valor': '6'},
        {'nome': AppLocalizations.of(context)!.costas, 'valor': '7'},
        {'nome': AppLocalizations.of(context)!.norteSul, 'valor': '8'},
        {'nome': AppLocalizations.of(context)!.quedas, 'valor': '9'}
      ].map<DropdownMenuItem<String>>((Map value) {
        return DropdownMenuItem<String>(
          value: value['valor'],
          child: Text(value['nome']),
        );
      }).toList(),
    );
  }

  Widget dropDown_nivel() {
    return DropdownButton<String>(
      value: nivel,
      icon: const Icon(Icons.arrow_downward),
      style: const TextStyle(color: Color(2583691263)),
      underline: Container(
        height: 1,
        color: Color(2583691263),
      ),
      onChanged: (String? newValue) {
        setState(() {
          nivel = newValue!;
        });
      },
      items: [
        {'nome': AppLocalizations.of(context)!.branca, 'valor': 'Branca'},
        {'nome': AppLocalizations.of(context)!.azul, 'valor': 'azul'},
        {'nome': AppLocalizations.of(context)!.roxa, 'valor': 'roxa'},
        {'nome': AppLocalizations.of(context)!.marrom, 'valor': 'marrom'},
        {'nome': AppLocalizations.of(context)!.preta, 'valor': 'preta'}
      ].map<DropdownMenuItem<String>>((Map value) {
        return DropdownMenuItem<String>(
          value: value['valor'],
          child: Text(value['nome']),
        );
      }).toList(),
    );
  }

  Widget dropDown_sub() {
    return DropdownButton<String>(
      value: sub,
      icon: const Icon(Icons.arrow_downward),
      style: const TextStyle(color: Color(2583691263)),
      underline: Container(
        height: 1,
        color: Color(2583691263),
      ),
      onChanged: (String? newValue) {
        setState(() {
          sub = newValue!;
        });
      },
      items: [
        {'nome': AppLocalizations.of(context)!.passagem, 'valor': 'Passagem'},
        {'nome': AppLocalizations.of(context)!.raspagem, 'valor': 'Raspagem'},
        {'nome': AppLocalizations.of(context)!.finalizacao, 'valor': 'Finalização'},
        {'nome': AppLocalizations.of(context)!.reposicao, 'valor': 'Reposição'},
        {'nome': AppLocalizations.of(context)!.outra, 'valor': 'Outra'}
      ].map<DropdownMenuItem<String>>((Map value) {
        return DropdownMenuItem<String>(
          value: value['valor'],
          child: Text(value['nome']),
        );
      }).toList(),
    );
  }

  /* Componentes reutilizados*/
  Widget seletor(dropdown_item) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.only(bottom: 20),
      child: dropdown_item,
    );
  }

  Widget inputDefault(marginValue, hintValue, controleValue, funcao) {
    return Container(
      margin: marginValue,
      child: TextFormField(
          controller: controleValue,
          decoration: InputDecoration(
            hintText: hintValue,
            border: const OutlineInputBorder(),
          ),
          onChanged: funcao),
    );
  }
}
