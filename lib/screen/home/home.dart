import 'package:flutter/material.dart';
import 'package:jjc/screen/atualize/atualiza.dart';
import 'package:jjc/screen/home/cartoes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jjc/screen/widgets/floatingActionButton/floatinAction_controller.dart';
import 'package:jjc/screen/widgets/scaffoldStandart.dart'; // important
import 'package:jjc/global_services/global.dart' as global;

class Home extends StatefulWidget {
  //const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //List<Widget> cards = new List.generate(20, (i) => new Cartoes()).toList();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: floatinAction_controller.instance.logado, builder: (context, value, child){
      print(global.uptodate);
      if(floatinAction_controller.instance.logado.value != null){
        return ScaffoldStandart(
          bodyElement: const cartoes(),
          titulo: AppLocalizations.of(context)!.tituloHome,
          index: 0,
          button: true,
        );
      }else{
        if(global.uptodate == true || global.uptodate == null){
          return Container(
            color: Colors.black,
            child: Center(
              child: Text(
                'JJC',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  decoration: TextDecoration.none),
                )
              ),
            );
        }else{
          return atualize();
        }
        
      }
      
    });
  }
}