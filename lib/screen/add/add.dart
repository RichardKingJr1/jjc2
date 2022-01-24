import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jjc/global_services/global.dart' as global;

import 'package:jjc/screen/widgets/app_botton.dart';
import 'package:jjc/screen/widgets/menuDrawer.dart';
import 'package:loader_overlay/loader_overlay.dart';

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
  String fim = "null";

  TextEditingController _controller_nome = TextEditingController();
  TextEditingController _controller_id = TextEditingController();
  TextEditingController _controller_agrupamento = TextEditingController();
  TextEditingController _controller_nivel = TextEditingController();
  TextEditingController _controller_observacoes = TextEditingController();
  TextEditingController _controller_inicio = TextEditingController();
  TextEditingController _controller_fim = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      endDrawer: menuDrawer(),
      appBar: AppBar(
        title: const Text('Adicionar Técnica'),
      ),
      body: Container(
        child: Material(
          child: SafeArea(
            child: Container(
              //alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
/*                 mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center, */
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: TextFormField(
                      controller: _controller_nome,
                      decoration: InputDecoration(
                        hintText: "Nome da técnica",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => setState(() => nome = value),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                        controller: _controller_id,
                        decoration: InputDecoration(
                          hintText: "Id do video",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) => setState(() => idVideo = value)),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: _controller_observacoes,
                      decoration: InputDecoration(
                        hintText: "Observação",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => observacoes = value,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _controller_inicio,
                      decoration: InputDecoration(
                        hintText: "Inicio do Video Segundos",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => inicio = value,
                    ),
                  ),
                  Container(
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
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    margin: EdgeInsets.only(bottom: 20),
                    child: dropDown_agrupamento(),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    margin: EdgeInsets.only(bottom: 20),
                    child: dropDown_nivel(),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    margin: EdgeInsets.only(bottom: 20),
                    child: dropDown_sub(),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(minimumSize: Size(400, 65)),
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
      ),
      bottomNavigationBar: appBotton(
        cont: context,
        selectedIndex: 2,
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
      'tec': tec
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
          dialog(context);
          _controller_nome.clear();
          _controller_id.clear();
          _controller_agrupamento.clear();
          _controller_inicio.clear();
          _controller_fim.clear();
          _controller_nivel.clear();
          _controller_observacoes.clear();
        });
      }
    });

    context.loaderOverlay.hide();
  }

  Widget dialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: AlertDialog(
            title: Text("Técnica Adicionada"),
            actions: [
              Align(
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("ok")),
              )
            ],
          ),
        );
      },
    );
    return Text('dsfadsf');
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
}
