
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/models/aula_model.dart';
import 'dart:convert';
import 'package:jjc/repository/aula_repository.dart';
import 'package:jjc/stores/globalStore.dart';
import 'package:jjc/stores/userStore.dart';
import 'package:jjc/widgets/alertDialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddController {

  //final url = Uri.parse('http://10.0.2.2:4000/criar_conta');
  
  var userStore = GetIt.I.get<UserStore>();
  var globalStore = GetIt.I.get<GlobalStore>();

  aulaRepository repositorio;
  AddController({required this.repositorio});

  AulaModel aula = AulaModel();

  final TextEditingController controllerNome = TextEditingController();
  final TextEditingController controllerId = TextEditingController();
  final TextEditingController controllerNivel = TextEditingController();
  final TextEditingController controllerObservacoes = TextEditingController();
  final TextEditingController controllerInicio = TextEditingController();
  final TextEditingController controllerFim = TextEditingController();
  final TextEditingController controllerPasso = TextEditingController();


  set nome(String value) => aula.nome = value;
  set idVideo(String value) => aula.idVideo = value;
  set tec(String value) => aula.tec = value;
  set sub(String value) => aula.sub = value;
  set nivel(String value) => aula.nivel = value;
  set observacoes(String value) => aula.observacoes = value;
  set inicio(String value) => aula.inicio = value;
  set fim(String value) => aula.fim = value;
  set passo(String value) => aula.passo = value;
  set gi(bool value) => aula.gi = value;

  bool get gi => aula.gi!;
  String get tec => aula.tec!;
  String get nivel => aula.nivel!;
  String get sub => aula.sub!;
  

  atualizar() async {
    Map dataObj = {'token': userStore.token, 'email': userStore.user.email};

      repositorio.getTec(dataObj).then((response){

        dynamic data = json.decode(utf8.decode(response.bodyBytes));

        if (response.statusCode == 200) {

          userStore.updateMyTec(data['prop_tec']);
        }

      });

      
  }

  void submit(overlay, cont) async {

    if(aula.nome != '' && aula.idVideo != ''){
      Map dataObj = {
        'nome': aula.nome,
        'idVideo': aula.idVideo,
        'agrupamento': userStore.user.email,
        'nivel': nivel,
        'observacoes': aula.observacoes,
        'inicio': aula.inicio,
        'fim': aula.fim,
        'sub': sub,
        'regiao': globalStore.regiao,
        'tec': tec,
        'passo': aula.passo,
        'gi': gi
      };

      //context.loaderOverlay.show();

      overlay.show();
      
      repositorio.addTec(dataObj).then((response) {
        if (response.statusCode == 200) {

            Dialogs.alerta(cont, AppLocalizations.of(cont)!.alertaTecAdd, "Ok");
            controllerNome.clear();
            controllerId.clear();
            controllerInicio.clear();
            controllerFim.clear();
            controllerNivel.clear();
            controllerObservacoes.clear();
            controllerPasso.clear();
      
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