import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jjc/router_generator.dart';

import 'package:http/http.dart' as http;
import 'package:jjc/global_services/global.dart' as global;
import 'package:jjc/screen/login/login/login_controller.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  MyApp() {
    getData();
  }

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: MaterialApp(
        localizationsDelegates:
            AppLocalizations.localizationsDelegates, // important
        supportedLocales: AppLocalizations.supportedLocales,
        title: 'Jiu Lib',
        locale: _locale,
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

  await http.get(Uri.parse(global.endereco + 'versao?versao=' + global.versao))
  .then((response) {
    if (response.statusCode == 200) {
      global.uptodate = true;
    } else {
      global.uptodate = false;
    }

    login_controller.instance.login();
    
    return true;
  });

}
