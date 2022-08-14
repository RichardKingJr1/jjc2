import 'package:mobx/mobx.dart';
part 'globalStore.g.dart';

class GlobalStore = GlobalStoreBase with _$GlobalStore;

abstract class GlobalStoreBase with Store {

  static const String _regiao = 'br';
  static const String endereco = 'https://qmmshcm485.execute-api.us-east-2.amazonaws.com/prod/';
  static const String versao = '1';

  @observable
  bool? _uptodate = null;

  @observable
  bool _gi = true;

  @observable
  bool _existe = false;

  @observable
  int _index = -1;

  @action
  setUpToDate(bool value){
    _uptodate = value;
  }

  @action
  setGi(){
    _gi = !_gi;
  }

  @action
  void setExiste(value){
    _existe = value;
  }

  @action
  void setIndex(value){
    _index = value;
  }

  bool? get uptodate => _uptodate; 
  bool get gi => _gi; 
  bool get existe => _existe; 
  int get index => _index; 
  String get regiao => _regiao;

}