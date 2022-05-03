import 'package:flutter/material.dart';

class contador extends StatefulWidget {
  int reps;
  contador({ Key? key, required this.reps }) : super(key: key);

  @override
  State<contador> createState() => _contadorState();
}

class _contadorState extends State<contador> {
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
              onPressed: () => {},
            ),
          ),
          SizedBox(
            width: 100,
            child: Center(child: Text('21', style: TextStyle(color: Colors.black, fontSize: 18),))
            //child: Center(child: Text(widget.reps.toString(), style: TextStyle(color: Colors.black, fontSize: 18),))
          ),
          SizedBox(
            width: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0),
                minimumSize: const Size.fromHeight(40)),
              child: const Center(child: Text('+')),
              onPressed: () => {},
            ),
          ),
        ],
      ),
    );
  }
}