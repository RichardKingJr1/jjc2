import 'package:flutter/material.dart';
import 'package:jjc/screen/widgets/app_botton.dart';

class Home extends StatefulWidget {
  //const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //List<Widget> cards = new List.generate(20, (i) => new Cartoes()).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jiu Jitsu Club'),
      ),
      body: Container(
        //margin: const EdgeInsets.only(top: 5),
        child: cartoes(),
      ),
      bottomNavigationBar: appBotton(cont: context, selectedIndex: 0),
    );
  }
}

//Cartoes onde serão marcados os exercicios
Widget cartoes() {
  String letra = '1';

  List itens = [];

  itens.add({'index': '1', 'texto': 'Guarda Fechada'});
  itens.add({'index': '2', 'texto': 'Guada Aberta'});
  itens.add({'index': '3', 'texto': 'Passagem de Pé'});
  itens.add({'index': '4', 'texto': 'Meia Guarda'});
  itens.add({'index': '5', 'texto': '100 Kilos'});
  itens.add({'index': '6', 'texto': 'Montada'});
  itens.add({'index': '7', 'texto': 'Costas'});
  itens.add({'index': '8', 'texto': 'Norte-Sul'});
  itens.add({'index': '9', 'texto': 'Quedas'});

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
                  Navigator.of(context)
                      .pushNamed('/posicoes', arguments: itens[index]["index"]);
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
