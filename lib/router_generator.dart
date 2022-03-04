import 'package:flutter/material.dart';
import 'package:jjc/screen/add/add.dart';
import 'package:jjc/screen/aula/aula.dart';
import 'package:jjc/screen/home/home.dart';
import 'package:jjc/screen/login/criar_conta.dart';
import 'package:jjc/screen/login/login.dart';
import 'package:jjc/screen/login/recuperar_senha.dart';
import 'package:jjc/screen/m_lib/m_lib.dart';
import 'package:jjc/screen/perfil/editor.dart';
import 'package:jjc/screen/perfil/minhas_bibliotecas.dart';
import 'package:jjc/screen/perfil/perfil.dart';
import 'package:jjc/screen/perfil/minhas_posicoes.dart';
import 'package:jjc/screen/posicoes/posicoes.dart';
import 'package:jjc/screen/atualize/atualiza.dart';

import 'package:jjc/global_services/global.dart' as global;
import 'package:jjc/screen/t_plans/t_plans.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        if (global.uptodate == false) {
          return MaterialPageRoute(builder: (_) => atualize());
        }
        return MaterialPageRoute(builder: (_) => Home());

      case '/lib':
        if (global.globalVar['logado'] == true) {
          return MaterialPageRoute(builder: (_) => MLib());
        } else {
          return MaterialPageRoute(builder: (_) => Login());
        }

      case '/posicoes':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => Posicoes(data: args));
        }
        return _errorRoute();

      case '/aula':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => Aula(args));
        }
        return _errorRoute();

      case '/add':
        if (global.globalVar['logado'] == true) {
          return MaterialPageRoute(builder: (_) => addPosicao());
        } else {
          return MaterialPageRoute(builder: (_) => Login());
        }
      case '/plans':
        return MaterialPageRoute(builder: (_) => t_plans());

      /* Area de Login */
      case '/recuperar_senha':
        return MaterialPageRoute(builder: (_) => RecuperarSenha());
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
      case '/criar_conta':
        return MaterialPageRoute(builder: (_) => criarConta());

      /* Area Perfil */
      case '/perfil':
        return MaterialPageRoute(builder: (_) => Perfil());
      case '/minhas_posicoes':
        return MaterialPageRoute(builder: (_) => Mposicoes());
      case '/editor':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => Editor(index: args));
        }
        return _errorRoute();
      case '/minhas_bibliotecas':
        return MaterialPageRoute(builder: (_) => mBibliotecas());

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
