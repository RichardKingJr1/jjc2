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
      currentIndex: widget.selectedIndex,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home), title: Container(height: 0.0)),
        BottomNavigationBarItem(
            icon: Icon(Icons.local_library), title: Container(height: 0.0)),
        BottomNavigationBarItem(
            icon: Icon(Icons.library_add), title: Container(height: 0.0)),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today), title: Container(height: 0.0))
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

/* class appBotton extends StatelessWidget {
  var cont;
  int _selectedIndex = 0;

  appBotton({Key? key, required this.cont}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home), title: Container(height: 0.0)),
        BottomNavigationBarItem(
            icon: Icon(Icons.local_library), title: Container(height: 0.0)),
        BottomNavigationBarItem(
            icon: Icon(Icons.library_add), title: Container(height: 0.0)),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), title: Container(height: 0.0))
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
          _selectedIndex = 0;
          Navigator.of(cont)
              .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
          break;
        case 1:
          _selectedIndex = 1;
          Navigator.of(cont)
              .pushNamedAndRemoveUntil('/lib', (Route<dynamic> route) => false);
          break;
        case 2:
          _selectedIndex = 2;
          Navigator.of(cont)
              .pushNamedAndRemoveUntil('/add', (Route<dynamic> route) => false);
          break;
        case 3:
          _selectedIndex = 3;
          Navigator.of(cont).pushNamedAndRemoveUntil(
              '/perfil', (Route<dynamic> route) => false);
          break;
      }
    })
  }
}
 */