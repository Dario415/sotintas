// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartController on _CartControllerBase, Store {
  late final _$cartListAtom =
      Atom(name: '_CartControllerBase.cartList', context: context);

  @override
  ObservableList<dynamic> get cartList {
    _$cartListAtom.reportRead();
    return super.cartList;
  }

  @override
  set cartList(ObservableList<dynamic> value) {
    _$cartListAtom.reportWrite(value, super.cartList, () {
      super.cartList = value;
    });
  }

  late final _$_CartControllerBaseActionController =
      ActionController(name: '_CartControllerBase', context: context);

  @override
  dynamic loadCart() {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.loadCart');
    try {
      return super.loadCart();
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getItensCart() {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.getItensCart');
    try {
      return super.getItensCart();
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQuantity(
      {required String id, required Map<String, dynamic> body}) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.setQuantity');
    try {
      return super.setQuantity(id: id, body: body);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeItem({required String id}) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.removeItem');
    try {
      return super.removeItem(id: id);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cartList: ${cartList}
    ''';
  }
}
