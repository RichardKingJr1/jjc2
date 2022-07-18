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
  late aulaModel aula; 

  late TextEditingController controller_nome;
  late TextEditingController controller_id;
  late TextEditingController controller_nivel;
  late TextEditingController controller_observacoes;
  late TextEditingController controller_inicio;
  late TextEditingController controller_fim;
  late TextEditingController controller_passo;

  int indexPosicao;

  EditorController(this.indexPosicao) {
    aula = aulaModel(
      id_posicao: userStore.user.prop_tec[indexPosicao]['id_posicao'], 
      nome: userStore.user.prop_tec[indexPosicao]['nome'], 
      idVideo: userStore.user.prop_tec[indexPosicao]['idVideo'], 
      tec: userStore.user.prop_tec[indexPosicao]['tec'], 
      sub: userStore.user.prop_tec[indexPosicao]['sub'], 
      nivel: userStore.user.prop_tec[indexPosicao]['nivel'], 
      observacoes: userStore.user.prop_tec[indexPosicao]['observacoes'], 
      inicio: userStore.user.prop_tec[indexPosicao]['inicio'], 
      fim: userStore.user.prop_tec[indexPosicao]['fim'], 
      passo: userStore.user.prop_tec[indexPosicao]['passo']
    );
    controller_nome = TextEditingController(text: aula.nome);
    controller_id  = TextEditingController(text: aula.idVideo);
    controller_nivel  = TextEditingController(text: aula.nivel);
    controller_observacoes  = TextEditingController(text: aula.observacoes);
    controller_inicio  = TextEditingController(text: aula.inicio);
    controller_fim  = TextEditingController(text: aula.fim); 
    controller_passo  = TextEditingController(text: aula.passo);
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

  String get gi => aula.gi;
  String get tec => aula.tec;
  String get nivel => aula.nivel;
  String get sub => aula.sub;


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

      if (response.statusCode == 200) {
        
        userStore.updateMyTec(data['prop_tec']);
      }
    });
  }
  
}