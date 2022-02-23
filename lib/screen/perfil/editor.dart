import 'package:flutter/material.dart';

import 'package:jjc/screen/widgets/app_botton.dart';
import 'package:jjc/screen/widgets/menuDrawer.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:http/http.dart' as http;
import 'package:jjc/global_services/global.dart' as global;
import 'dart:convert';

class Editor extends StatefulWidget {
  final url = Uri.parse(global.endereco + 'editar_tec');
  String index = '';

  Editor({required this.index});

  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  int index_posicao = 0;

  String agrupamento = '';
  String nome = '';
  String idVideo = "";
  String tec = '1';
  String sub = "Outra";
  String nivel = "Branca";
  String observacoes = "";
  String inicio = "0";
  String fim = "null";
  String passo = "";
  String id_posicao = '';

  late TextEditingController _controller_nome;
  late TextEditingController _controller_id;
  late TextEditingController _controller_agrupamento;
  late TextEditingController _controller_nivel;
  late TextEditingController _controller_observacoes;
  late TextEditingController _controller_inicio;
  late TextEditingController _controller_fim;
  late TextEditingController _controller_passo;

  void initState() {
    super.initState();
    index_posicao = int.parse(widget.index);
    agrupamento = global.prop_tec[index_posicao]['agrupamento'];
    id_posicao = global.prop_tec[index_posicao]['id_posicao'];
    nome = global.prop_tec[index_posicao]['nome'];
    idVideo = global.prop_tec[index_posicao]['idVideo'];
    tec = global.prop_tec[index_posicao]['tec'];
    sub = global.prop_tec[index_posicao]['sub'];
    nivel = global.prop_tec[index_posicao]['nivel'];
    observacoes = global.prop_tec[index_posicao]['observacoes'];
    inicio = global.prop_tec[index_posicao]['inicio'];
    fim = global.prop_tec[index_posicao]['fim'];
    passo = global.prop_tec[index_posicao]['passo'];

    _controller_nome = TextEditingController(text: nome);
    _controller_id = TextEditingController(text: idVideo);
    _controller_agrupamento = TextEditingController(text: agrupamento);
    _controller_nivel = TextEditingController(text: nivel);
    _controller_observacoes = TextEditingController(text: observacoes);
    _controller_inicio = TextEditingController(text: inicio);
    _controller_fim = TextEditingController(text: fim);
    _controller_passo = TextEditingController(text: passo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      endDrawer: menuDrawer(),
      appBar: AppBar(
        title: const Text('Adicionar Técnica'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
                      style:
                          ElevatedButton.styleFrom(minimumSize: Size(400, 65)),
                      // fromHeight use double.infinity as width and 40 is the height
                      child: Text('Editar'),
                      onPressed: () => update(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red, minimumSize: Size(400, 65)),
                      // fromHeight use double.infinity as width and 40 is the height
                      child: Text('Deletar'),
                      onPressed: () => delete(),
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

  void update() async {
    Map dataObj = {
      'id_posicao': id_posicao,
      'agrupamento': global.globalVar['email'],
      'nome': nome,
      'idVideo': idVideo,
      'nivel': nivel,
      'observacoes': observacoes,
      'inicio': inicio,
      'fim': fim,
      'sub': sub,
      'regiao': global.regiao,
      'tec': tec,
      'passo': passo,
      'index': index_posicao
    };

    context.loaderOverlay.show();

    //String S_dataObj = jsonEncode(dataObj);

    await http
        .post(widget.url,
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(dataObj))
        .then((response) {
      if (response.statusCode == 200) {
        dialog(context, 'Técnica Atualizada');
        atualizar();
      }
    });

    context.loaderOverlay.hide();
  }

  delete() async {
    context.loaderOverlay.show();

    //String S_dataObj = jsonEncode(dataObj);
    Map dataObj = {
      'id_posicao': id_posicao,
      'agrupamento': global.globalVar['email'],
      'index': index_posicao,
      'regiao': global.regiao,
      'tec': tec
    };

    await http
        .post(Uri.parse(global.endereco + 'delete_tec'),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(dataObj))
        .then(
          (response) => {
            if (response.statusCode == 200)
              {
                atualizar(),
                dialog(context, 'Técnica Excluida'),
              },
          },
        );

    context.loaderOverlay.hide();
  }

  Widget dialog(BuildContext context, msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: AlertDialog(
            title: Text(msg),
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

        Navigator.of(context).pushNamedAndRemoveUntil(
            '/minhas_posicoes', (Route<dynamic> route) => false);
      }
    });
  }
}
