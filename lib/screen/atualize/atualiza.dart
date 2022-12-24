import 'package:flutter/material.dart';

class Atualize extends StatefulWidget {
  const Atualize({Key? key}) : super(key: key);

  @override
  _AtualizeState createState() => _AtualizeState();
}

class _AtualizeState extends State<Atualize> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Atualize o aplicativo na app store'),
    );
  }
}
