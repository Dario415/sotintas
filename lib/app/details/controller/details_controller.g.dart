// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailsController on _DetailsControllerBase, Store {
  late final _$imagesListAtom =
      Atom(name: '_DetailsControllerBase.imagesList', context: context);

  @override
  ObservableList<dynamic> get imagesList {
    _$imagesListAtom.reportRead();
    return super.imagesList;
  }

  @override
  set imagesList(ObservableList<dynamic> value) {
    _$imagesListAtom.reportWrite(value, super.imagesList, () {
      super.imagesList = value;
    });
  }

  late final _$differentialsListAtom =
      Atom(name: '_DetailsControllerBase.differentialsList', context: context);

  @override
  ObservableList<dynamic> get differentialsList {
    _$differentialsListAtom.reportRead();
    return super.differentialsList;
  }

  @override
  set differentialsList(ObservableList<dynamic> value) {
    _$differentialsListAtom.reportWrite(value, super.differentialsList, () {
      super.differentialsList = value;
    });
  }

  late final _$_DetailsControllerBaseActionController =
      ActionController(name: '_DetailsControllerBase', context: context);

  @override
  dynamic getImages(String id) {
    final _$actionInfo = _$_DetailsControllerBaseActionController.startAction(
        name: '_DetailsControllerBase.getImages');
    try {
      return super.getImages(id);
    } finally {
      _$_DetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getDifferentials(String id) {
    final _$actionInfo = _$_DetailsControllerBaseActionController.startAction(
        name: '_DetailsControllerBase.getDifferentials');
    try {
      return super.getDifferentials(id);
    } finally {
      _$_DetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
imagesList: ${imagesList},
differentialsList: ${differentialsList}
    ''';
  }
}
