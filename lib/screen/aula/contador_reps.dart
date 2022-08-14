import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/stores/globalStore.dart';
import 'package:jjc/stores/userStore.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Contador extends StatefulWidget {
  final int index;
  final bool gi;
  Contador({ Key? key, required this.index, required this.gi }) : super(key: key);

  var userStore = GetIt.I.get<UserStore>();
  var globalStore = GetIt.I.get<GlobalStore>();

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {

  @override
  Widget build(BuildContext context) {
    //String repValue = '1';
    return Container(
      child: Row(
        children: [
           Text(AppLocalizations.of(context)!.reps, style: TextStyle(color: Colors.black, fontSize: 18),),
          SizedBox(
            width: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0),
                minimumSize: const Size.fromHeight(40)),
              child: const Center(child: Text('-')),
              onPressed: () => widget.userStore.contarRep(widget.index, -1, widget.gi),
            ),
          ),
          Observer(
            builder: (_) {   
              //print('****INDEX: '+widget.globalStore.index.toString()); 
              if(widget.globalStore.existe) {
                return SizedBox(
                  width: 100,
                  child: Center(child: Text( (widget.userStore.user.myLib[widget.index == -1 ? 0 : widget.index].reps ?? 0).toString(), style: TextStyle(color: Colors.black, fontSize: 18))),
                );
              } else{
                return Container();
              }     
            }
          ),
          SizedBox(
            width: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0),
                minimumSize: const Size.fromHeight(40)),
              child: const Center(child: Text('+')),
              onPressed: () => widget.userStore.contarRep(widget.index, 1, widget.gi),
            ),
          ), 
        ],
      ),
    );
  }
}