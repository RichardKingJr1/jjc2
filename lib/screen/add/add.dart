import 'package:flutter/material.dart';
import 'package:jjc/repository/aula_repository.dart';
import 'package:jjc/screen/add/add_controller.dart';
import 'package:jjc/widgets/scaffoldStandart.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class addPosicao extends StatefulWidget {

  addPosicao({Key? key}) : super(key: key);

  @override
  _addPosicaoState createState() => _addPosicaoState();
}

class _addPosicaoState extends State<addPosicao> {

  AddController instance = AddController(repositorio: aulaRepository());

  
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
                  instance.controllerNome,
                  (value) => setState(() => instance.nome = value),
                ),
                inputDefault(
                  const EdgeInsets.only(bottom: 20),
                  AppLocalizations.of(context)!.idTec,
                  instance.controllerId,
                  (value) => setState(() => instance.idVideo = value),
                ),
                inputDefault(
                  const EdgeInsets.only(bottom: 20),
                  AppLocalizations.of(context)!.observacoesTec,
                  instance.controllerObservacoes,
                  (value) => instance.observacoes = value,
                ),
                inputDefault(
                  const EdgeInsets.only(bottom: 20),
                  AppLocalizations.of(context)!.inicioTec,
                  instance.controllerInicio,
                  (value) => instance.inicio = value,
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
                    controller: instance.controllerPasso,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.passoTec,
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (value) => instance.passo = value,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(400, 65)),
                    // fromHeight use double.infinity as width and 40 is the height
                    child: Text(AppLocalizations.of(context)!.addTec),
                    onPressed: () => instance.submit(context.loaderOverlay, context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  

  /* DropsDowns */

  Widget dropDown_gi() {
    return DropdownButton<String>(
      value: instance.gi,
      icon: const Icon(Icons.arrow_downward),
      style: const TextStyle(color: Color(2583691263)),
      underline: Container(
        height: 1,
        color: Color(2583691263),
      ),
      onChanged: (String? newValue) {
        setState(() {
          instance.gi = newValue!;
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
