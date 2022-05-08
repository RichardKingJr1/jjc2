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
  String toString() {
    return '''

    ''';
  }
}
