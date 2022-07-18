import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/screen/perfil/minhas_bibliotecas/minhas_bibliotecas_controller.dart';
import 'package:jjc/stores/userStore.dart';
import 'package:jjc/widgets/app_botton.dart';
import 'package:jjc/widgets/menuDrawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:jjc/global_services/global.dart' as global;
import 'package:mobx/mobx.dart';

class MBibliotecas extends StatefulWidget {
  const MBibliotecas({Key? key}) : super(key: key);

  @override
  State<MBibliotecas> createState() => _MBibliotecasState();
}

class _MBibliotecasState extends State<MBibliotecas> {

  var userStore = GetIt.I.get<UserStore>();  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MinhasBibliotecasController.instance.userStore.token != '' ? menuDrawer() : null,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.minhasBibliotecas), //Minhas Bibliotecas 
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context)
              .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: TextFormField(
              style: const TextStyle(color: Colors.black),
              keyboardType: TextInputType.number,
              controller: MinhasBibliotecasController.instance.controllerBibliotecaId,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                hintText: AppLocalizations.of(context)!.idBiblioteca,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),
                border: const UnderlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () => {
                    MinhasBibliotecasController.instance.adicionar(context, context.loaderOverlay),
                  },
                  icon: const Icon(Icons.add),
                ),
              ),
              onChanged: MinhasBibliotecasController.instance.setBibliotecaId,
              //onChanged: (value) => inicio = value,
            ),
          ),
          Expanded(
            child: Container(
              child: Observer(
                builder: (_) {
                  return cartoes(MinhasBibliotecasController.instance.userStore.user.agrupamento);
                }
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: appBotton(
        cont: context,
        selectedIndex: 1,
      ),
    );
  }

  //Cartoes onde serão marcados os exercicios
  Widget cartoes(bibliotecas) {
    if (bibliotecas == []) {
      return Text('Carregando');
    } else {
      return ListView.builder(
        itemCount: bibliotecas.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TextButton(
                    onPressed: () {
                      /* Navigator.of(context)
                          .pushNamed('/aula', arguments: jsonEncode(global.myLib[index])); */
                    },
                    child: Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(left: 15, top: 15),
                      child: Stack(children: [
                        Container(
                          child: Text(
                            bibliotecas[index],
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          ),
                        ),
                        Container(
                            alignment: Alignment.centerRight,
                            margin: const EdgeInsets.only(bottom: 15),
                            child: TextButton(
                              onPressed: () => {
                                MinhasBibliotecasController.instance.apagar(index, context, context.loaderOverlay),
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.grey,
                                size: 30.0,
                              ),
                            )),
                      ]),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }
  
}
