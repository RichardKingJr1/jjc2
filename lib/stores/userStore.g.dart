// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on UserStoreBase, Store {
  late final _$userAtom = Atom(name: 'UserStoreBase.user', context: context);

  @override
  userModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(userModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$tokenAtom = Atom(name: 'UserStoreBase.token', context: context);

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$UserStoreBaseActionController =
      ActionController(name: 'UserStoreBase', context: context);

  @override
  dynamic login(
      dynamic token,
      String id_user,
      String email,
      List<dynamic> myLib,
      List<dynamic> myLibNogi,
      List<dynamic> prop_tec,
      List<dynamic> agrupamento) {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.login');
    try {
      return super.login(
          token, id_user, email, myLib, myLibNogi, prop_tec, agrupamento);
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic logout() {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.logout');
    try {
      return super.logout();
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
token: ${token}
    ''';
  }
}
