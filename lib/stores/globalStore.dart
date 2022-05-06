import 'package:mobx/mobx.dart';
part 'globalStore.g.dart';

class GlobalStore = GlobalStoreBase with _$GlobalStore;

abstract class GlobalStoreBase with Store {

  String regiao = 'br';
  String endereco = 'https://qmmshcm485.execute-api.us-east-2.amazonaws.com/prod/';
  String versao = '1';

  

  @observable
  bool? uptodate = null;

  @observable
  bool gi = true;

}