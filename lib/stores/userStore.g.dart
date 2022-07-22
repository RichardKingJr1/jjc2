// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on UserStoreBase, Store {
  late final _$userAtom = Atom(name: 'UserStoreBase.user', context: context);

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$logadoAtom =
      Atom(name: 'UserStoreBase.logado', context: context);

  @override
  bool get logado {
    _$logadoAtom.reportRead();
    return super.logado;
  }

  @override
  set logado(bool value) {
    _$logadoAtom.reportWrite(value, super.logado, () {
      super.logado = value;
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

  late final _$_libCarregadaAtom =
      Atom(name: 'UserStoreBase._libCarregada', context: context);

  @override
  List<dynamic> get _libCarregada {
    _$_libCarregadaAtom.reportRead();
    return super._libCarregada;
  }

  @override
  set _libCarregada(List<dynamic> value) {
    _$_libCarregadaAtom.reportWrite(value, super._libCarregada, () {
      super._libCarregada = value;
    });
  }

  late final _$UserStoreBaseActionController =
      ActionController(name: 'UserStoreBase', context: context);

  @override
  void login(
      dynamic token,
      String id_user,
      String email,
      List<AulaModel> myLib,
      List<AulaModel> myLibNogi,
      List<AulaModel> prop_tec,
      List<String> agrupamento) {
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
  void logout() {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.logout');
    try {
      return super.logout();
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void atualizarLib(dynamic libs, dynamic email) {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.atualizarLib');
    try {
      return super.atualizarLib(libs, email);
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateMyTec(dynamic tec) {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.updateMyTec');
    try {
      return super.updateMyTec(tec);
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addMyLib(dynamic aula) {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.addMyLib');
    try {
      return super.addMyLib(aula);
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addMyLibNoGi(dynamic aula) {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.addMyLibNoGi');
    try {
      return super.addMyLibNoGi(aula);
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeMyLib(dynamic index) {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.removeMyLib');
    try {
      return super.removeMyLib(index);
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeMyLibNoGi(dynamic index) {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.removeMyLibNoGi');
    try {
      return super.removeMyLibNoGi(index);
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLibCarregada(dynamic lib) {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.setLibCarregada');
    try {
      return super.setLibCarregada(lib);
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void contarRep(int index, int valor, bool gi) {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.contarRep');
    try {
      return super.contarRep(index, valor, gi);
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
logado: ${logado},
token: ${token}
    ''';
  }
}
