// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ShopController on _ShopControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_ShopControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$onlyDeliveryFreeAtom =
      Atom(name: '_ShopControllerBase.onlyDeliveryFree', context: context);

  @override
  bool get onlyDeliveryFree {
    _$onlyDeliveryFreeAtom.reportRead();
    return super.onlyDeliveryFree;
  }

  @override
  set onlyDeliveryFree(bool value) {
    _$onlyDeliveryFreeAtom.reportWrite(value, super.onlyDeliveryFree, () {
      super.onlyDeliveryFree = value;
    });
  }

  late final _$resultsAtom =
      Atom(name: '_ShopControllerBase.results', context: context);

  @override
  int get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(int value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  late final _$paintListAtom =
      Atom(name: '_ShopControllerBase.paintList', context: context);

  @override
  ObservableList<dynamic> get paintList {
    _$paintListAtom.reportRead();
    return super.paintList;
  }

  @override
  set paintList(ObservableList<dynamic> value) {
    _$paintListAtom.reportWrite(value, super.paintList, () {
      super.paintList = value;
    });
  }

  late final _$_ShopControllerBaseActionController =
      ActionController(name: '_ShopControllerBase', context: context);

  @override
  dynamic loadItens() {
    final _$actionInfo = _$_ShopControllerBaseActionController.startAction(
        name: '_ShopControllerBase.loadItens');
    try {
      return super.loadItens();
    } finally {
      _$_ShopControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic searchPaints(String text) {
    final _$actionInfo = _$_ShopControllerBaseActionController.startAction(
        name: '_ShopControllerBase.searchPaints');
    try {
      return super.searchPaints(text);
    } finally {
      _$_ShopControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deliveryFreeOrNot(bool? check) {
    final _$actionInfo = _$_ShopControllerBaseActionController.startAction(
        name: '_ShopControllerBase.deliveryFreeOrNot');
    try {
      return super.deliveryFreeOrNot(check);
    } finally {
      _$_ShopControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPaints() {
    final _$actionInfo = _$_ShopControllerBaseActionController.startAction(
        name: '_ShopControllerBase.getPaints');
    try {
      return super.getPaints();
    } finally {
      _$_ShopControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getAllPaints() {
    final _$actionInfo = _$_ShopControllerBaseActionController.startAction(
        name: '_ShopControllerBase.getAllPaints');
    try {
      return super.getAllPaints();
    } finally {
      _$_ShopControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getDeliveryFree() {
    final _$actionInfo = _$_ShopControllerBaseActionController.startAction(
        name: '_ShopControllerBase.getDeliveryFree');
    try {
      return super.getDeliveryFree();
    } finally {
      _$_ShopControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
onlyDeliveryFree: ${onlyDeliveryFree},
results: ${results},
paintList: ${paintList}
    ''';
  }
}
