import 'package:flutter/material.dart';
import 'package:jjc/screen/perfil/editor/editor_controller.dart';

import 'package:jjc/screen/widgets/app_botton.dart';
import 'package:jjc/screen/widgets/menuDrawer.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:jjc/global_services/global.dart' as global;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Editor extends StatefulWidget {
  
  String index = '';

  Editor({required this.index});

  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {

  late EditorController instance; 

  var items = [
        'Guarda Fechada',
        'Guarda Aberta',
        'Passagem de pé',
        'Meia Guarda',
        '100 Kilos',
        'Montada',
        'Costas',
        'Norte-Sul',
        'Queda'
      ];


  void initState() {
    super.initState();
    instance = EditorController(int.parse(widget.index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      endDrawer: global.token != '' ? menuDrawer() : null,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.addTec),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
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
                      controller: instance.controller_nome,
                      decoration: InputDecoration(
                        hintText: "Nome da técnica",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => setState(() => instance.nome = value),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: instance.controller_observacoes,
                      decoration: InputDecoration(
                        hintText: "Observação",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => instance.observacoes = value,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: instance.controller_inicio,
                      decoration: InputDecoration(
                        hintText: "Inicio do Video Segundos",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => instance.inicio = value,
                    ),
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
                  /* Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    margin: EdgeInsets.only(bottom: 20),
                    child: dropDown_agrupamento(),
                  ), */
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(items[int.parse(instance.tec)-1]) ,
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
                      controller: instance.controller_passo,
                      decoration: InputDecoration(
                        hintText: "Passo a passo da técnica",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => instance.passo = value,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(minimumSize: Size(400, 65)),
                      // fromHeight use double.infinity as width and 40 is the height
                      child: Text('Editar'),
                      onPressed: () => instance.update(context.loaderOverlay, context),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red, minimumSize: Size(400, 65)),
                      // fromHeight use double.infinity as width and 40 is the height
                      child: Text('Deletar'),
                      onPressed: () => instance.delete(context.loaderOverlay, context),
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
                      int count = 0;
                      Navigator.of(context).popUntil((_) => count++ >= 2);
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
      value: instance.tec,
      icon: const Icon(Icons.arrow_downward),
      style: const TextStyle(color: Color(2583691263)),
      underline: Container(
        height: 1,
        color: Color(2583691263),
      ),
      onChanged: (String? newValue) {
        setState(() {
          instance.tec = newValue!;
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
      value: instance.nivel,
      icon: const Icon(Icons.arrow_downward),
      style: const TextStyle(color: Color(2583691263)),
      underline: Container(
        height: 1,
        color: Color(2583691263),
      ),
      onChanged: (String? newValue) {
        setState(() {
          instance.nivel = newValue!;
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
      value: instance.sub,
      icon: const Icon(Icons.arrow_downward),
      style: const TextStyle(color: Color(2583691263)),
      underline: Container(
        height: 1,
        color: Color(2583691263),
      ),
      onChanged: (String? newValue) {
        setState(() {
          instance.sub = newValue!;
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
