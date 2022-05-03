
import 'package:flutter/cupertino.dart';
import 'package:jjc/models/aula_model.dart';
import 'package:jjc/global_services/global.dart' as global;
import 'dart:convert';
import 'package:jjc/repository/aula_repository.dart';
import 'package:jjc/screen/widgets/alertDialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddController {

  //final url = Uri.parse('http://10.0.2.2:4000/criar_conta');
  
  aulaRepository repositorio;
  AddController({required this.repositorio});

  aulaModel aula = aulaModel();

  final TextEditingController controller_nome = TextEditingController();
  final TextEditingController controller_id = TextEditingController();
  final TextEditingController controller_nivel = TextEditingController();
  final TextEditingController controller_observacoes = TextEditingController();
  final TextEditingController controller_inicio = TextEditingController();
  final TextEditingController controller_fim = TextEditingController();
  final TextEditingController controller_passo = TextEditingController();


  set nome(String value) => aula.nome = value;
  set idVideo(String value) => aula.idVideo = value;
  set tec(String value) => aula.tec = value;
  set sub(String value) => aula.sub = value;
  set nivel(String value) => aula.nivel = value;
  set observacoes(String value) => aula.observacoes = value;
  set inicio(String value) => aula.inicio = value;
  set fim(String value) => aula.fim = value;
  set passo(String value) => aula.passo = value;
  set gi(String value) => aula.gi = value;

  String get gi => aula.gi;
  String get tec => aula.tec;
  String get nivel => aula.nivel;
  String get sub => aula.sub;
  

  atualizar() async {
    Map dataObj = {'token': global.token, 'email': global.globalVar['email']};

      repositorio.getTec(dataObj).then((response){

        dynamic data = json.decode(utf8.decode(response.bodyBytes));

        if (response.statusCode == 200) {
          //Fazer login no global service
          //global.myLib = data['user']['m_tec'];
          global.prop_tec = data['prop_tec'];
        }

      });

      
  }

  void submit(overlay, cont) async {

    if(aula.nome != '' && aula.idVideo != ''){
      Map dataObj = {
        'nome': aula.nome,
        'idVideo': aula.idVideo,
        'agrupamento': global.globalVar['email'],
        'nivel': nivel,
        'observacoes': aula.observacoes,
        'inicio': aula.inicio,
        'fim': aula.fim,
        'sub': sub,
        'regiao': global.regiao,
        'tec': tec,
        'passo': aula.passo,
        'gi': gi
      };

      //context.loaderOverlay.show();

      overlay.show();
      
      repositorio.addTec(dataObj).then((response) {
        if (response.statusCode == 200) {

            Dialogs.alerta(cont, AppLocalizations.of(cont)!.alertaTecAdd, "Ok");
            controller_nome.clear();
            controller_id.clear();
            controller_inicio.clear();
            controller_fim.clear();
            controller_nivel.clear();
            controller_observacoes.clear();
            controller_passo.clear();
      
        }
      });

      //context.loaderOverlay.hide();
      overlay.hide();

      atualizar();
    }else{
      Dialogs.alerta(cont, AppLocalizations.of(cont)!.alertaPreencha, "Ok");
    }
  }
}