import 'package:jjc/models/user_model.dart';

class  ResponseLoginModel {
  UserModel? user;
  String? token;

  ResponseLoginModel({this.user, this.token});

  //'':  == null ? null : ,
  Map<String, dynamic> toJson() => {
    'token': token == null ? null : token,
    'user': user == null ? null : user!.toJson(),
  };
//: json[""] == null ? null : json[""],
  //Extract post from Map Object
  factory ResponseLoginModel.fromJson(Map<String, dynamic> json) => ResponseLoginModel(
    token: json["token"] == null ? null : json["token"],
    user: json['user'] == null ? null : UserModel.fromBack(json['user']),
  );

  factory ResponseLoginModel.fromBack(Map<String, dynamic> json) {
    //print('teste');
    print(UserModel.fromBack(json['user']).toJson());
    return ResponseLoginModel(
      token: json["token"] == null ? null : json["token"],
      user: json['user'] == null ? null : UserModel.fromBack(json['user']),
    );
  }
}