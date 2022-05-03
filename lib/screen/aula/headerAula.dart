import 'package:flutter/material.dart';
import 'package:jjc/global_services/global.dart' as global;
import 'package:jjc/screen/aula/headerAula_controller.dart';
/* import 'package:http/http.dart' as http;
import 'dart:convert'; */

class headerAula extends StatefulWidget {
  bool existe;
  final dynamic aula;
  final String nomeAula;

  /* final url1 = Uri.parse(global.endereco + 'add_to_lib');
  final url2 = Uri.parse(global.endereco + 'exclude_from_lib'); */

  headerAula(
      {Key? key,
      required this.nomeAula,
      required this.existe,
      required this.aula})
      : super(key: key);

  @override
  State<headerAula> createState() => _headerAulaState();
}

class _headerAulaState extends State<headerAula> {
  //create instance of controller (cria um objeto baseado na classe)

  @override
  Widget build(BuildContext context) {  
    print('inicio');
    headerAula_controller.instance.setExiste(widget.existe);
    return ValueListenableBuilder(valueListenable: headerAula_controller.instance.existe, builder: (context, value, child){
      return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 9,
            child: Text(
              widget.nomeAula,
              style: const TextStyle(color: Colors.black, fontSize: 21),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(child: () {
              if (!headerAula_controller.instance.existe.value & global.globalVar['logado'] == true) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                      minimumSize: const Size.fromHeight(40)),
                  // fromHeight use double.1infinity as width and 40 is the height
                  child: const Center(child: Text('+')),
                  onPressed: () => headerAula_controller.instance.adicionarPosicao(widget.aula),
                );
              } else if(global.globalVar['logado'] == true){
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0),
                      minimumSize: const Size.fromHeight(40)),
                  // fromHeight use double.1infinity as width and 40 is the height
                  child: const Center(child: Text('-')),
                  onPressed: () => headerAula_controller.instance.excluirPosicao(widget.aula),
                );
              }
            }()),
          ),
        ],
      ),
    );
    });
  }
}
