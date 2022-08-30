// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileController on _ProfileControllerBase, Store {
  late final _$profileAtom =
      Atom(name: '_ProfileControllerBase.profile', context: context);

  @override
  ProfileModel get profile {
    _$profileAtom.reportRead();
    return super.profile;
  }

  @override
  set profile(ProfileModel value) {
    _$profileAtom.reportWrite(value, super.profile, () {
      super.profile = value;
    });
  }

  late final _$getProfileAsyncAction =
      AsyncAction('_ProfileControllerBase.getProfile', context: context);

  @override
  Future getProfile() {
    return _$getProfileAsyncAction.run(() => super.getProfile());
  }

  late final _$_ProfileControllerBaseActionController =
      ActionController(name: '_ProfileControllerBase', context: context);

  @override
  dynamic logout() {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction(
        name: '_ProfileControllerBase.logout');
    try {
      return super.logout();
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
profile: ${profile}
    ''';
  }
}
