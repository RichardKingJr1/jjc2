import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/models/aula_model.dart';
import 'package:jjc/repository/aula_repository.dart';
import 'package:jjc/stores/globalStore.dart';
import 'package:jjc/stores/userStore.dart';
import 'package:jjc/widgets/alertDialog.dart';
import 'dart:convert';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditorController {
  
  var userStore = GetIt.I.get<UserStore>();
  var globalStore = GetIt.I.get<GlobalStore>();
  var respositorio = aulaRepository();
  late AulaModel aula; 

  late TextEditingController controllerNome;
  late TextEditingController controllerId;
  late TextEditingController controllerNivel;
  late TextEditingController controllerObservacoes;
  late TextEditingController controllerInicio;
  late TextEditingController controllerFim;
  late TextEditingController controllerPasso;

  int indexPosicao;

  EditorController(this.indexPosicao) {
    aula = AulaModel(
      id_posicao: userStore.user.propTec[indexPosicao].id_posicao, 
      nome: userStore.user.propTec[indexPosicao].nome, 
      idVideo: userStore.user.propTec[indexPosicao].idVideo, 
      tec: userStore.user.propTec[indexPosicao].tec, 
      sub: userStore.user.propTec[indexPosicao].sub, 
      nivel: userStore.user.propTec[indexPosicao].nivel, 
      observacoes: userStore.user.propTec[indexPosicao].observacoes, 
      inicio: userStore.user.propTec[indexPosicao].inicio, 
      fim: userStore.user.propTec[indexPosicao].fim, 
      passo: userStore.user.propTec[indexPosicao].passo
    );
    controllerNome = TextEditingController(text: aula.nome);
    controllerId  = TextEditingController(text: aula.idVideo);
    controllerNivel  = TextEditingController(text: aula.nivel);
    controllerObservacoes  = TextEditingController(text: aula.observacoes);
    controllerInicio  = TextEditingController(text: aula.inicio);
    controllerFim  = TextEditingController(text: aula.fim); 
    controllerPasso  = TextEditingController(text: aula.passo);
  }

  set nome(String value) => aula.nome = value;
  set idVideo(String value) => aula.idVideo = value;
  set tec(String value) => aula.tec = value;
  set sub(String value) => aula.sub = value;
  set nivel(String value) => aula.nivel = value;
  set observacoes(String value) => aula.observacoes = value;
  set inicio(String value) => aula.inicio = value;
  set fim(String value) => aula.fim = value;
  set passo(String value) => aula.passo = value;

  bool get gi => aula.gi;
  String get tec => aula.tec!;
  String get nivel => aula.nivel!;
  String get sub => aula.sub!;


  void update(overlay, cont) async {
    Map dataObj = {
      'id_posicao': aula.id_posicao,
      'agrupamento': userStore.user.email,
      'nome': aula.nome,
      'idVideo': aula.idVideo,
      'nivel': nivel,
      'observacoes': aula.observacoes,
      'inicio': aula.inicio,
      'fim': aula.fim,
      'sub': sub,
      'regiao': globalStore.regiao,
      'tec': tec,
      'passo': aula.passo,
      'index': indexPosicao,
      'gi': globalStore.gi
    };

    overlay.show();

    //String S_dataObj = jsonEncode(dataObj);

    respositorio.editarTec(dataObj)
    .then((response) {
      if (response.statusCode == 200) {
        Dialogs.alerta2(cont, AppLocalizations.of(cont)!.tecAtualizada, AppLocalizations.of(cont)!.ok);
        atualizar();
      }
    });

    overlay.hide();
  }

  delete(overlay, cont) async {
    overlay.show();

    //String S_dataObj = jsonEncode(dataObj);
    Map dataObj = {
      'id_posicao': aula.id_posicao,
      'agrupamento': userStore.user.email,
      'index': indexPosicao,
      'regiao': globalStore.regiao,
      'tec': tec,
      'gi': globalStore.gi
    };

    respositorio.deleteTec(dataObj)
    .then(
      (response) => {
        if (response.statusCode == 200)
          {
            atualizar(),
            Dialogs.alerta2(cont, AppLocalizations.of(cont)!.tecExcluida, AppLocalizations.of(cont)!.ok),
          },
      },
    );

    overlay.hide();
  }

  atualizar() async {
    //print('atualizar');
    Map dataObj = {'token': userStore.token, 'email': userStore.user.email};

      respositorio.getTec(dataObj)
      .then((response) {
      dynamic data = json.decode(utf8.decode(response.bodyBytes));
      List<AulaModel> dataTreated = List<AulaModel>.from((data['prop_tec'] as List).map((x) => AulaModel.fromJson(x)));

      if (response.statusCode == 200) {
        
        userStore.updateMyTec(dataTreated);
      }
    });
  }
  
}