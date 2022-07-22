import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/screen/aula/contador_reps_controller.dart';
import 'package:jjc/stores/userStore.dart';

class Contador extends StatefulWidget {
  final int index;
  final bool gi;
  const Contador({ Key? key, required this.index, required this.gi }) : super(key: key);

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {

  var userStore = GetIt.I.get<UserStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          const Text("Repetições: ", style: TextStyle(color: Colors.black, fontSize: 18),),
          SizedBox(
            width: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0),
                minimumSize: const Size.fromHeight(40)),
              child: const Center(child: Text('-')),
              onPressed: () => userStore.contarRep(widget.index, -1, widget.gi),
            ),
          ),
          SizedBox(
            width: 100,
            child: Center(child: Text(userStore.user.myLib![widget.index].reps.toString(), style: TextStyle(color: Colors.black, fontSize: 18),))
            //child: Center(child: Text(widget.reps.toString(), style: TextStyle(color: Colors.black, fontSize: 18),))
          ),
          SizedBox(
            width: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0),
                minimumSize: const Size.fromHeight(40)),
              child: const Center(child: Text('+')),
              onPressed: () => userStore.contarRep(widget.index, 1, widget.gi),
            ),
          ),
        ],
      ),
    );
  }
}