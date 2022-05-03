import 'package:flutter/material.dart';
import 'package:jjc/screen/perfil/editor/editor_controller.dart';

import 'package:jjc/widgets/app_botton.dart';
import 'package:jjc/widgets/menuDrawer.dart';
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
                        hintText: AppLocalizations.of(context)!.nomeTec,
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) =>  instance.nome = value,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: instance.controller_observacoes,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.observacoesTec,
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
                        hintText: AppLocalizations.of(context)!.inicioTec,
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => instance.inicio = value,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Text(items[int.parse(instance.tec)-1]) ,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    margin: const EdgeInsets.only(bottom: 20),
                    child: dropDown_nivel(),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    margin: const EdgeInsets.only(bottom: 20),
                    child: dropDown_sub(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      maxLines: 8,
                      controller: instance.controller_passo,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.passoTec,
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
                      child: Text(AppLocalizations.of(context)!.editar),
                      onPressed: () => instance.update(context.loaderOverlay, context),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red, minimumSize: Size(400, 65)),
                      // fromHeight use double.infinity as width and 40 is the height
                      child: Text(AppLocalizations.of(context)!.deleteTec),
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


  /* Widget dropDown_agrupamento() {
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
  } */

  /* Widget dropDown_nivel() {
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
  } */

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
}
