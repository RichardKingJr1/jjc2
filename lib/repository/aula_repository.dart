import 'package:http/http.dart' as http;
import 'package:jjc/global_services/global.dart' as global;
import 'dart:convert';

class aulaRepository {

  final url1 = Uri.parse(global.endereco + 'add_tec');
  final url2 = Uri.parse(global.endereco + 'editar_tec');

  getTec(dataObj) async {
    return await http
    .post(Uri.parse(global.endereco + 'update_tec'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(dataObj)
    );
    
  }

  addTec(dataObj) async {
    return await http
    .post(url1,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(dataObj)
    );
  }

  deleteTec(dataObj) async {
    return await http
    .post(Uri.parse(global.endereco + 'delete_tec'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(dataObj));
  } 

  editarTec(dataObj) async {
    return await http
    .post(url2,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(dataObj));

  }
}