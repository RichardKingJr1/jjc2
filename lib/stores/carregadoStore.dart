import 'package:mobx/mobx.dart';
part 'carregadoStore.g.dart';

class CarregadoStore = CarregadoStoreBase with _$CarregadoStore;

abstract class CarregadoStoreBase with Store {

  @observable
  List lib_carregada = [];

  @observable
  Map aulaCarregada = {};


}