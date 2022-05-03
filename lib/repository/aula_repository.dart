import 'package:http/http.dart' as http;
import 'package:jjc/global_services/global.dart' as global;
import 'dart:convert';

class aulaRepository {

  final url = Uri.parse(global.endereco + 'add_tec');

  getTec(dataObj) async {
    return await http
    .post(Uri.parse(global.endereco + 'update_tec'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(dataObj)
    );
    
  }

  addTec(dataObj) async {
    return await http
    .post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(dataObj)
    );
  }
}