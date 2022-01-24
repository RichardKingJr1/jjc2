import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jjc/router_generator.dart';

import 'package:http/http.dart' as http;
import 'package:jjc/global_services/global.dart' as global;
import 'package:loader_overlay/loader_overlay.dart';

void main() async {
  await getData();
  runApp(MyApp());
  //teste if version is open
}

class MyApp extends StatelessWidget {
  /* final url = Uri.parse(global.endereco + 'versao?versao=' + global.versao);

  @override
  void initState() {
    getData();
  } */

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: MaterialApp(
        title: 'Jiu Lib',
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: ThemeData.dark().copyWith(
            primaryColor: Colors.lightBlue,
            scaffoldBackgroundColor: Colors.white),
      ),
    );
  }
}

Future getData() async {
  print('teste');
  await http
      .get(Uri.parse(global.endereco + 'versao?versao=' + global.versao))
      .then((response) {
    if (response.statusCode == 200) {
      global.uptodate = true;
      return true;
    } else {
      global.uptodate = false;
      return false;
    }
  });
}
