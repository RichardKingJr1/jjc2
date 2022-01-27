import 'package:flutter/material.dart';
import 'package:jjc/screen/widgets/app_botton.dart';
import 'package:jjc/screen/widgets/menuDrawer.dart';

class t_plans extends StatefulWidget {
  const t_plans({Key? key}) : super(key: key);

  @override
  _t_plansState createState() => _t_plansState();
}

class _t_plansState extends State<t_plans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: menuDrawer(),
      appBar: AppBar(
        title: const Text('Jiu Jitsu Club'),
      ),
      body: Container(
        //margin: const EdgeInsets.only(top: 5),
        child: cartoes(),
      ),
      bottomNavigationBar: appBotton(cont: context, selectedIndex: 3),
    );
  }

  Widget cartoes() {
    List itens = [];

    itens.add({'index': '1', 'texto': 'Guarda Fechada'});
    itens.add({'index': '2', 'texto': 'Guada Aberta'});
    itens.add({'index': '3', 'texto': 'Passagem de Pé'});
    itens.add({'index': '4', 'texto': 'Meia Guarda'});
    itens.add({'index': '5', 'texto': '100 Kilos'});
    itens.add({'index': '6', 'texto': 'Montada'});

    return ListView.builder(
      itemCount: itens.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 5),
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/imgs/' + itens[index]["index"] + '.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.6), BlendMode.darken)),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/posicoes',
                        arguments: itens[index]["index"]);
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                      itens[index]["texto"],
                      style: TextStyle(color: Colors.white, fontSize: 23),
                    ),
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
