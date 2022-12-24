import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/models/aula_model.dart';
import 'package:mobx/mobx.dart';
part 'reviewStore.g.dart';


class ReviewStore = ReviewStoreBase with _$ReviewStore;

abstract class ReviewStoreBase with Store {

  @observable
  List<AulaModel> aulas = [AulaModel(nome: '1'), AulaModel(nome: '2'), AulaModel(nome: '3')];

  //await localStorage.write(key: "credenciais", value: json.encode(dataObj));
  //await localStorage.read(key: 'credenciais');
  @observable
  bool isDraggin = false; 
  @observable
  Offset position  = Offset.zero;
  @observable
  Size screenSize = Size.zero;
  @observable
  double angle = 0;

  @action
  void startPosition(DragStartDetails details){
    isDraggin = true; 
  }

  @action
  void updatePosition(DragUpdateDetails details){
    position += details.delta;

    final x = position.dx;
    angle = 45 * x / screenSize.width;
  }

  @action
  void endPosition(){
    isDraggin = false; 
    resetPosition();
  }

  void resetPosition(){
    
    position  = Offset.zero;
    angle = 0;
  }

  void setScreenSize(value) => screenSize = value;

  final localStorage = new FlutterSecureStorage();


  @observable
  List<List<Map<String, dynamic>>> caixas = [[], [], []];

  @observable 
  List<Map<String, dynamic>> caixaReview = [];

  @observable
  List<List<Map<String, dynamic>>> caixasNoGi = [[], [], []];

  @observable 
  List<Map<String, dynamic>> caixaReviewNoGi = [];

  ReviewStoreBase(int myLib, int myLibNoGi) {
    boxesInit(myLib, myLibNoGi);
  }

  boxesInit(int myLib, int myLibNoGi) async {
    //List<AulaModel>.from((json['myLib'] as List).map((x) => AulaModel.fromJson(x))),
    //caixas =  jsonDecode(await localStorage.read(key: 'caixas') ?? '');
    print(await localStorage.read(key: 'caixas'));
    //List<List<Map<String, dynamic>>>.from(caixas as List).map((x) => List<Map<String, dynamic>>.from(x as List).map((y) => y));

    if(caixas[0].length == 0 && caixas[1].length == 0 && caixas[2].length == 0){

      //criar lista para caixa 0
      caixas[0] = [for (var i = 0; i <= myLib/3; i++) {'id': i, 'acerto': false}];

      //criar lista para caixa 1
      caixas[1] = [for (var i = (myLib/3).floor(); i <= (myLib*2/3).floor(); i++) {'id': i, 'acerto': false}];

      //criar lista para caixa 2
      caixas[2] = [for (var i = (myLib*2/3).floor(); i <= myLib; i++) {'id': i, 'acerto': false}];

      localStorage.write(key: "caixas", value: json.encode(caixas));

    }

    if(caixasNoGi[0].length == 0 && caixasNoGi[1].length == 0 && caixasNoGi[2].length == 0){

      //criar lista para caixa 0
      caixasNoGi[0] = [for (var i = 0; i <= myLibNoGi/3; i++) {'id': i, 'acerto': false}];

      //criar lista para caixa 1
      caixasNoGi[1] = [for (var i = (myLibNoGi/3).floor(); i <= (myLibNoGi*2/3).floor(); i++) {'id': i, 'acerto': false}];

      //criar lista para caixa 2
      caixasNoGi[2] = [for (var i = (myLibNoGi*2/3).floor(); i <= myLibNoGi; i++) {'id': i, 'acerto': false}];

    }

    if(caixaReview.isEmpty){
      caixaReview = caixas.removeAt(0);
      caixas.add([]);
      localStorage.write(key: "caixas", value: json.encode(caixas));
    }

    if(caixaReviewNoGi.isEmpty){
      caixaReviewNoGi = caixasNoGi.removeAt(0);
      caixasNoGi.add([]);
    }

    print(caixas);

  }

  void addMove(int index){
    caixas[0].add({'id': index, 'acerto': false});
    localStorage.write(key: "caixas", value: json.encode(caixas));
  }

  void removeMove(id){

    caixas[0].removeWhere((element) => element['id'] == id);

    //caixas[0]
    for(var i = 0 ; i < caixas[0].length; i++ ){
      if(caixas[0][i]['id'] > id ){
        caixas[0][i]['id'] = caixas[0][i]['id'] - 1;
      }
    }

    for(var i = 0 ; i < caixas[1].length; i++ ){
      if(caixas[1][i]['id'] > id ){
        caixas[1][i]['id'] = caixas[1][i]['id'] - 1;
      }
    }

    for(var i = 0 ; i < caixas[2].length; i++ ){
      if(caixas[2][i]['id'] > id ){
        caixas[2][i]['id'] = caixas[2][i]['id'] - 1;
      }
    }

    localStorage.write(key: "caixas", value: json.encode(caixas));

  }

  Map<String, dynamic> fetchMove(){
    if(caixaReview.isEmpty){
      caixaReview = caixas.removeAt(0);
      caixas.add([]);
    }

    caixas[0].add(caixaReview[0]);
    return caixaReview.removeAt(0);
  }

  void corret(){
    if(caixas[0][-1]['acerto'] == true){
      caixas[2].add(caixas[0][-1]);
    }else{
      caixas[1].add(caixas[0][-1]);
    }
  }

  @action
  void onDragEnd(DraggableDetails details, AulaModel aula) {
    final minimumDrag = 100;
    if (details.offset.dx > minimumDrag) {
      //aula.isSwipedOff = true;
      aulas.remove(aula); 
    } else if (details.offset.dx < -minimumDrag) {
      //aula.isLiked = true;
      aulas.remove(aula); 
    }
  }

}


/* 

//criar 3 caixas de espaçamento mais uma de leitura atual

//se a caixa de leitura estiver vazia move a primeira caixa de espaçamento para leitura e cria uma caixa de espaçamento nova

//33% em cada

//inicialmente dividido igualmente entre 1, 2, 3

item que foi errado vai pra caixa 1
item que foi acertado vai pra caixa 2
item que foi acertado duas vezes vai para 3

salva no localstorage

quando um item é adicionado vai para a caixa 1

quando item é excluido loop as caixas removendo o item e subtraindo o valor

 */