import 'package:jjc/models/aula_model.dart';

class UserModel {

  String id_user;

  String email;

  List<AulaModel> myLib;

  List<AulaModel> myLibNogi;

  List<AulaModel> propTec;

  List<String> agrupamento;

  //teste mudando para outra lib

  Map? aulaCarregada;

  UserModel({
    this.id_user = '',
    this.email = '',
    required this.myLib,
    required this.myLibNogi,
    required this.propTec,
    required this.agrupamento
  });

  //'':  == null ? null : ,
  /* Map<String, dynamic> toJson() => {

    'id_user': id_user == null ? null : id_user,
    'email': email == null ? null : email,
    'myLib': myLib == null ? null : List<dynamic>.from(myLib.map((x) => x.toJson())),
    'myLibNogi': myLibNogi == null ? null : List<dynamic>.from(myLibNogi.map((x) => x.toJson())),
    'propTec': propTec == null ? null : List<dynamic>.from(propTec.map((x) => x.toJson())),
    'agrupamento': agrupamento == null ? null : List<dynamic>.from(agrupamento.map((x) => x)),

  }; */

  Map<String, dynamic> toJson() => {

    'id_user':  id_user,
    'email': email,
    'myLib': List<dynamic>.from(myLib.map((x) => x.toJson())),
    'myLibNogi': List<dynamic>.from(myLibNogi.map((x) => x.toJson())),
    'propTec': List<dynamic>.from(propTec.map((x) => x.toJson())),
    'agrupamento': List<dynamic>.from(agrupamento.map((x) => x)),

  };


//: json[""] == null ? null : json[""],
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id_user: json["id_user"],
    email: json["email"],
    myLib: List<AulaModel>.from((json['myLib'] as List).map((x) => AulaModel.fromJson(json))),
    myLibNogi: List<AulaModel>.from((json['myLibNogi'] as List).map((x) => AulaModel.fromJson(json))),
    propTec: List<AulaModel>.from((json['propTec'] as List).map((x) => AulaModel.fromJson(json))),
    agrupamento: List<String>.from((json['agrupamento'] as List).map((x) => x)),
  );  


  factory UserModel.fromBack(Map<String, dynamic> json) { 

    /* return UserModel(
      id_user: json["id_user"] == null ? null : json["email"],
      email: json["email"] == null ? null : json["email"],
      myLib: json['m_tec'] == null ? null : List<AulaModel>.from((json['m_tec'] as List).map((x) => AulaModel.fromJson(json))),
      myLibNogi: json['m_tec_nogi'] == null ? null : List<AulaModel>.from((json['m_tec_nogi'] as List).map((x) => AulaModel.fromJson(json))),
      propTec: json['prop_tec'] == null ? null : List<AulaModel>.from((json['prop_tec'] as List).map((x) => AulaModel.fromJson(json))),
      //agrupamento: json['agrupamento'] == null ? null : List<String>.from(json['agrupamento'].map((x) => x)),
      agrupamento: [],
    ); */ 
    return UserModel(
      id_user: json["email"],
      email: json["email"],
      myLib: List<AulaModel>.from((json['m_tec'] as List).map((x) => AulaModel.fromJson(x))),
      myLibNogi:List<AulaModel>.from((json['m_tec_nogi'] as List).map((x) => AulaModel.fromJson(x))),
      propTec: List<AulaModel>.from((json['prop_tec'] as List).map((x) => AulaModel.fromJson(x))),
      //agrupamento: List<String>.from((json['agrupamento'] as List).map((x) => x)),
      agrupamento: List<String>.from((json['libs'] as List).map((x) => x)),
    );
  }

}