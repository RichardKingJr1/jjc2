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
                  "Nome da técnica",
                  _controller_nome,
                  (value) => setState(() => nome = value),
                ),
                inputDefault(
                  const EdgeInsets.only(bottom: 20),
                  "Id do video",
                  _controller_id,
                  (value) => setState(() => idVideo = value),
                ),
                inputDefault(
                  const EdgeInsets.only(bottom: 20),
                  "Observação",
                  _controller_observacoes,
                  (value) => observacoes = value,
                ),
                inputDefault(
                  const EdgeInsets.only(bottom: 20),
                  "Inicio do Video Segundos",
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

                seletor(dropDown_agrupamento()),
                seletor(dropDown_nivel()),
                seletor(dropDown_sub()),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    maxLines: 8,
                    controller: _controller_passo,
                    decoration: InputDecoration(
                      hintText: "Passo a passo da técnica",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => passo = value,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(400, 65)),
                    // fromHeight use double.infinity as width and 40 is the height
                    child: Text('Adicionar'),
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
      'passo': passo
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
          Dialogs.alerta(context, "Técnica Adicionada", "Ok");
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
        {'nome': 'Guarda Fechada', 'valor': '1'},
        {'nome': 'Guarda Aberta', 'valor': '2'},
        {'nome': 'Passagem de pé', 'valor': '3'},
        {'nome': 'Meia Guarda', 'valor': '4'},
        {'nome': '100 Kilos', 'valor': '5'},
        {'nome': 'Montada', 'valor': '6'},
        {'nome': 'Costas', 'valor': '7'},
        {'nome': 'Norte-SUl', 'valor': '8'},
        {'nome': 'Queda', 'valor': '9'}
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
      items: <String>['Branca', 'Azul', 'Roxa', 'Marrom', 'Preta']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
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
      items: <String>[
        'Passagem',
        'Raspagem',
        'Finalização',
        'Reposição',
        'Outra'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
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
