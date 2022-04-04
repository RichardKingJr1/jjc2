import 'package:flutter/material.dart';
import 'package:jjc/global_services/global.dart';
import 'package:jjc/global_services/global.dart' as global;

class floating extends StatefulWidget {
  bool button;
  floating({ Key? key, required this.button }) : super(key: key);

  @override
  State<floating> createState() => _floatingState();
}

class _floatingState extends State<floating> {
  @override
  Widget build(BuildContext context) {
    if(widget.button){
      return FloatingActionButton(
      backgroundColor: Color.fromARGB(255, 75, 75, 75),
      foregroundColor: Color.fromARGB(255, 255, 255, 255),
      onPressed: () {
        print(global.globalVar['gi']);
        setState(() {
          global.globalVar['gi'] = !global.globalVar['gi'];
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
            if (global.globalVar['gi']) ...[
              Text("GI", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 19),),
            ] else ...[
              Text("GI", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 19),),
              Icon(Icons.do_not_disturb_outlined, size: 55,),
            ],
        ],

      ),
    );
  }else{
    return SizedBox.shrink();
  }
    
  }
}



/* Widget floating() => FloatingActionButton(
  backgroundColor: Color.fromARGB(255, 75, 75, 75),
  foregroundColor: Color.fromARGB(255, 255, 255, 255),
  onPressed: () {
    print(global.globalVar['gi']);
    global.globalVar['gi'] = !global.globalVar['gi'];
  },
  child: Stack(
    alignment: Alignment.center,
    children: [
        if (global.globalVar['gi']) ...[
          Text("GI", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 19),),
        ] else ...[
          Text("GI", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 19),),
          Icon(Icons.do_not_disturb_outlined, size: 55,),
        ],
    ],

  ),
); */