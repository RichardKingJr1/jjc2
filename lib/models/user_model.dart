class userModel {

  String id_user = '';

  String email = '';

  List myLib = [];

  List myLibNogi = [];

  List prop_tec = [];

  List agrupamento = ['2'];

  //teste mudando para outra lib

  List lib_carregada = [];

  Map aulaCarregada = {};

  userModel({
    id_user = '',
    email = '',
    myLib,
    myLibNogi,
    prop_tec,
    agrupamento
  }){
    this.agrupamento = ['2'];
  }

}