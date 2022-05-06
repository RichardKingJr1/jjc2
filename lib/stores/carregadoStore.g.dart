// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carregadoStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CarregadoStore on CarregadoStoreBase, Store {
  late final _$lib_carregadaAtom =
      Atom(name: 'CarregadoStoreBase.lib_carregada', context: context);

  @override
  List<dynamic> get lib_carregada {
    _$lib_carregadaAtom.reportRead();
    return super.lib_carregada;
  }

  @override
  set lib_carregada(List<dynamic> value) {
    _$lib_carregadaAtom.reportWrite(value, super.lib_carregada, () {
      super.lib_carregada = value;
    });
  }

  late final _$aulaCarregadaAtom =
      Atom(name: 'CarregadoStoreBase.aulaCarregada', context: context);

  @override
  Map<dynamic, dynamic> get aulaCarregada {
    _$aulaCarregadaAtom.reportRead();
    return super.aulaCarregada;
  }

  @override
  set aulaCarregada(Map<dynamic, dynamic> value) {
    _$aulaCarregadaAtom.reportWrite(value, super.aulaCarregada, () {
      super.aulaCarregada = value;
    });
  }

  @override
  String toString() {
    return '''
lib_carregada: ${lib_carregada},
aulaCarregada: ${aulaCarregada}
    ''';
  }
}
