import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sotintas/app/core/repository/app_repository.dart';
import 'package:sotintas/app/profile/models/profile_model.dart';
part 'profile_controller.g.dart';

// ignore: library_private_types_in_public_api
class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  final _repository = GetIt.I.get<AppRepository>();

  @observable
  late ProfileModel profile = ProfileModel(email: '', avatar: '', name: '');

  @action
  logout(){
    _repository.logout();
  }
  
  @action
  getProfile() {
    _repository.getProfile().then((value) {
      profile = ProfileModel(
        email: value.name,
        avatar: value.avatar,
        name: value.name,
      );
    });
  }
}
