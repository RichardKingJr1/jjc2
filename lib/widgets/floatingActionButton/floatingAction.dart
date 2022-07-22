import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/stores/globalStore.dart';
import 'package:jjc/widgets/floatingActionButton/floatinAction_controller.dart';

class floating extends StatefulWidget {
  bool button;
  floating({ Key? key, required this.button }) : super(key: key);

  @override
  State<floating> createState() => _floatingState();
}

class _floatingState extends State<floating> {

  var storeGlobal = GetIt.I.get<GlobalStore>();

  @override
  Widget build(BuildContext context) {
    if(widget.button){
      return FloatingActionButton(
      backgroundColor: Color.fromARGB(255, 75, 75, 75),
      foregroundColor: Color.fromARGB(255, 255, 255, 255),
      onPressed: () => floatinAction_controller.instance.setGi(),
      child: Observer(builder: (_){
        return Stack(
          alignment: Alignment.center,
          children: [
              if (storeGlobal.gi) ...[
                Text("GI", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 19),),
              ] else ...[
                Text("GI", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 19),),
                Icon(Icons.do_not_disturb_outlined, size: 55,),
              ],
          ],
        );
      })
    );
  }else{
    return SizedBox.shrink();
  }
    
  }
}
