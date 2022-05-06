// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'globalStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GlobalStore on GlobalStoreBase, Store {
  late final _$uptodateAtom =
      Atom(name: 'GlobalStoreBase.uptodate', context: context);

  @override
  bool? get uptodate {
    _$uptodateAtom.reportRead();
    return super.uptodate;
  }

  @override
  set uptodate(bool? value) {
    _$uptodateAtom.reportWrite(value, super.uptodate, () {
      super.uptodate = value;
    });
  }

  late final _$giAtom = Atom(name: 'GlobalStoreBase.gi', context: context);

  @override
  bool get gi {
    _$giAtom.reportRead();
    return super.gi;
  }

  @override
  set gi(bool value) {
    _$giAtom.reportWrite(value, super.gi, () {
      super.gi = value;
    });
  }

  @override
  String toString() {
    return '''
uptodate: ${uptodate},
gi: ${gi}
    ''';
  }
}
