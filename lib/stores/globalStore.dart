import 'package:mobx/mobx.dart';
part 'globalStore.g.dart';

class GlobalStore = GlobalStoreBase with _$GlobalStore;

abstract class GlobalStoreBase with Store {

  static const String regiao = 'br';
  static const String endereco = 'https://qmmshcm485.execute-api.us-east-2.amazonaws.com/prod/';
  static const String versao = '1';

  @observable
  bool? _uptodate = null;

  @observable
  bool _gi = true;

  @action
  setUpToDate(bool value){
    _uptodate = value;
  }

  @action
  setGi(){
    _gi = !_gi;
  }

  bool? get uptodate => _uptodate; 
  bool get gi => _gi; 

}