import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/screen/login/login/login_controller.dart';
import 'package:jjc/stores/globalStore.dart';
import 'package:jjc/stores/userStore.dart';
import 'package:jjc/global_services/global.dart' as global;
import 'package:http/http.dart' as http;

class PreCarregamento extends StatelessWidget {
  
  PreCarregamento({ Key? key }) : super(key: key);

  var instance = loginController(userStore: GetIt.I.get<UserStore>()); 
  var globalStore = GetIt.I.get<GlobalStore>();

  
  @override
  Widget build(BuildContext context) {
    getData(context);
    
    return Container(
      color: Colors.black,
      child: const Center(
        child: Text(
          'JJC',
          style: TextStyle(
            color: Colors.white,
            fontSize: 60,
            decoration: TextDecoration.none),
          )
        ),
      );
  }

  Future<bool> getData(cont) async {

    //var instance = loginController(userStore: Provider.of<UserStore>(cont)); 
    //var globalStore = Provider.of<GlobalStore>(cont);

    try{
      await http.get(Uri.parse(global.endereco + 'versao?versao=' + global.versao))
      .then((response) async {
        if (response.statusCode == 200) {
          globalStore.setUpToDate(true);
          
          await instance.login();
          Navigator.of(cont).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);

        } else {
          globalStore.setUpToDate(false);
          Navigator.of(cont).pushNamedAndRemoveUntil('/atualiza', (Route<dynamic> route) => false);
        }
      });       
    }finally{
      Navigator.of(cont).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
    }       
    return true;
  }

  
}