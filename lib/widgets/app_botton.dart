import 'package:flutter/material.dart';

class appBotton extends StatefulWidget {
  var cont;
  int selectedIndex;

  appBotton({Key? key, required this.cont, required this.selectedIndex})
      : super(key: key);

  @override
  _appBottonState createState() => _appBottonState();
}

class _appBottonState extends State<appBotton> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: widget.selectedIndex,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home), label: '' ),
        BottomNavigationBarItem(
            icon: Icon(Icons.local_library), label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.library_add), label: ''),
        /* BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today), title: Container(height: 0.0)) */
      ],
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
      onTap: onTap,
    );
  }

  void onTap(int index) {
    setState(() {
      switch (index) {
        case 0:
          Navigator.of(widget.cont)
              .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
          break;
        case 1:
          Navigator.of(widget.cont)
              .pushNamedAndRemoveUntil('/lib', (Route<dynamic> route) => false);
          break;
        case 2:
          Navigator.of(widget.cont)
              .pushNamedAndRemoveUntil('/add', (Route<dynamic> route) => false);
          break;
        case 3:
          Navigator.of(widget.cont).pushNamedAndRemoveUntil(
              '/plans', (Route<dynamic> route) => false);
          break;
      }
    });
  }
}
