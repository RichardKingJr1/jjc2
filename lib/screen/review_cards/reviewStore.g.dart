// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviewStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReviewStore on ReviewStoreBase, Store {
  late final _$isDragginAtom =
      Atom(name: 'ReviewStoreBase.isDraggin', context: context);

  @override
  bool get isDraggin {
    _$isDragginAtom.reportRead();
    return super.isDraggin;
  }

  @override
  set isDraggin(bool value) {
    _$isDragginAtom.reportWrite(value, super.isDraggin, () {
      super.isDraggin = value;
    });
  }

  late final _$positionAtom =
      Atom(name: 'ReviewStoreBase.position', context: context);

  @override
  Offset get position {
    _$positionAtom.reportRead();
    return super.position;
  }

  @override
  set position(Offset value) {
    _$positionAtom.reportWrite(value, super.position, () {
      super.position = value;
    });
  }

  late final _$screenSizeAtom =
      Atom(name: 'ReviewStoreBase.screenSize', context: context);

  @override
  Size get screenSize {
    _$screenSizeAtom.reportRead();
    return super.screenSize;
  }

  @override
  set screenSize(Size value) {
    _$screenSizeAtom.reportWrite(value, super.screenSize, () {
      super.screenSize = value;
    });
  }

  late final _$aulasAtom =
      Atom(name: 'ReviewStoreBase.aulas', context: context);

  @override
  List<AulaModel> get aulas {
    _$aulasAtom.reportRead();
    return super.aulas;
  }

  @override
  set aulas(List<AulaModel> value) {
    _$aulasAtom.reportWrite(value, super.aulas, () {
      super.aulas = value;
    });
  }

  late final _$caixasAtom =
      Atom(name: 'ReviewStoreBase.caixas', context: context);

  @override
  List<List<Map<String, dynamic>>> get caixas {
    _$caixasAtom.reportRead();
    return super.caixas;
  }

  @override
  set caixas(List<List<Map<String, dynamic>>> value) {
    _$caixasAtom.reportWrite(value, super.caixas, () {
      super.caixas = value;
    });
  }

  late final _$caixaReviewAtom =
      Atom(name: 'ReviewStoreBase.caixaReview', context: context);

  @override
  List<Map<String, dynamic>> get caixaReview {
    _$caixaReviewAtom.reportRead();
    return super.caixaReview;
  }

  @override
  set caixaReview(List<Map<String, dynamic>> value) {
    _$caixaReviewAtom.reportWrite(value, super.caixaReview, () {
      super.caixaReview = value;
    });
  }

  late final _$caixasNoGiAtom =
      Atom(name: 'ReviewStoreBase.caixasNoGi', context: context);

  @override
  List<List<Map<String, dynamic>>> get caixasNoGi {
    _$caixasNoGiAtom.reportRead();
    return super.caixasNoGi;
  }

  @override
  set caixasNoGi(List<List<Map<String, dynamic>>> value) {
    _$caixasNoGiAtom.reportWrite(value, super.caixasNoGi, () {
      super.caixasNoGi = value;
    });
  }

  late final _$caixaReviewNoGiAtom =
      Atom(name: 'ReviewStoreBase.caixaReviewNoGi', context: context);

  @override
  List<Map<String, dynamic>> get caixaReviewNoGi {
    _$caixaReviewNoGiAtom.reportRead();
    return super.caixaReviewNoGi;
  }

  @override
  set caixaReviewNoGi(List<Map<String, dynamic>> value) {
    _$caixaReviewNoGiAtom.reportWrite(value, super.caixaReviewNoGi, () {
      super.caixaReviewNoGi = value;
    });
  }

  late final _$ReviewStoreBaseActionController =
      ActionController(name: 'ReviewStoreBase', context: context);

  @override
  void startPosition(DragStartDetails details) {
    final _$actionInfo = _$ReviewStoreBaseActionController.startAction(
        name: 'ReviewStoreBase.startPosition');
    try {
      return super.startPosition(details);
    } finally {
      _$ReviewStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatePosition(DragUpdateDetails details) {
    final _$actionInfo = _$ReviewStoreBaseActionController.startAction(
        name: 'ReviewStoreBase.updatePosition');
    try {
      return super.updatePosition(details);
    } finally {
      _$ReviewStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void endPosition() {
    final _$actionInfo = _$ReviewStoreBaseActionController.startAction(
        name: 'ReviewStoreBase.endPosition');
    try {
      return super.endPosition();
    } finally {
      _$ReviewStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onDragEnd(DraggableDetails details, AulaModel aula) {
    final _$actionInfo = _$ReviewStoreBaseActionController.startAction(
        name: 'ReviewStoreBase.onDragEnd');
    try {
      return super.onDragEnd(details, aula);
    } finally {
      _$ReviewStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDraggin: ${isDraggin},
position: ${position},
screenSize: ${screenSize},
aulas: ${aulas},
caixas: ${caixas},
caixaReview: ${caixaReview},
caixasNoGi: ${caixasNoGi},
caixaReviewNoGi: ${caixaReviewNoGi}
    ''';
  }
}
