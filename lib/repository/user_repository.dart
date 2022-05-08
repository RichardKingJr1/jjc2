import 'package:http/http.dart' as http;
import 'package:jjc/global_services/global.dart' as global;
import 'dart:convert';

class userRepository {

  final url1 = Uri.parse(global.endereco + 'criar_conta');
  final url2 = Uri.parse(global.endereco + 'login');

  loginRequest(dataObj) async {
    return await http.post(
        url2,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(dataObj));
  }

  registerRequest(dataObj) async {
    return await http
      .post(url1,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(dataObj));
  }

}