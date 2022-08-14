// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'globalStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GlobalStore on GlobalStoreBase, Store {
  late final _$_uptodateAtom =
      Atom(name: 'GlobalStoreBase._uptodate', context: context);

  @override
  bool? get _uptodate {
    _$_uptodateAtom.reportRead();
    return super._uptodate;
  }

  @override
  set _uptodate(bool? value) {
    _$_uptodateAtom.reportWrite(value, super._uptodate, () {
      super._uptodate = value;
    });
  }

  late final _$_giAtom = Atom(name: 'GlobalStoreBase._gi', context: context);

  @override
  bool get _gi {
    _$_giAtom.reportRead();
    return super._gi;
  }

  @override
  set _gi(bool value) {
    _$_giAtom.reportWrite(value, super._gi, () {
      super._gi = value;
    });
  }

  late final _$_existeAtom =
      Atom(name: 'GlobalStoreBase._existe', context: context);

  @override
  bool get _existe {
    _$_existeAtom.reportRead();
    return super._existe;
  }

  @override
  set _existe(bool value) {
    _$_existeAtom.reportWrite(value, super._existe, () {
      super._existe = value;
    });
  }

  late final _$_indexAtom =
      Atom(name: 'GlobalStoreBase._index', context: context);

  @override
  int get _index {
    _$_indexAtom.reportRead();
    return super._index;
  }

  @override
  set _index(int value) {
    _$_indexAtom.reportWrite(value, super._index, () {
      super._index = value;
    });
  }

  late final _$GlobalStoreBaseActionController =
      ActionController(name: 'GlobalStoreBase', context: context);

  @override
  dynamic setUpToDate(bool value) {
    final _$actionInfo = _$GlobalStoreBaseActionController.startAction(
        name: 'GlobalStoreBase.setUpToDate');
    try {
      return super.setUpToDate(value);
    } finally {
      _$GlobalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setGi() {
    final _$actionInfo = _$GlobalStoreBaseActionController.startAction(
        name: 'GlobalStoreBase.setGi');
    try {
      return super.setGi();
    } finally {
      _$GlobalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExiste(dynamic value) {
    final _$actionInfo = _$GlobalStoreBaseActionController.startAction(
        name: 'GlobalStoreBase.setExiste');
    try {
      return super.setExiste(value);
    } finally {
      _$GlobalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIndex(dynamic value) {
    final _$actionInfo = _$GlobalStoreBaseActionController.startAction(
        name: 'GlobalStoreBase.setIndex');
    try {
      return super.setIndex(value);
    } finally {
      _$GlobalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
