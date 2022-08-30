import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sotintas/app/core/data/local_data.dart';
import 'package:sotintas/app/core/repository/app_repository.dart';
import 'package:sotintas/app/profile/models/profile_model.dart';
part 'profile_controller.g.dart';

// ignore: library_private_types_in_public_api
class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  final _repository = GetIt.I.get<AppRepository>();
  final _localData = GetIt.I.get<LocalData>();

  @observable
  late ProfileModel profile = ProfileModel(email: '', avatar: '', name: '');

  @action
  logout() {
    _repository.logout();
    _localData.cleanToken();
  }

  @action
  getProfile() async {
    profile = await _repository.getProfile();
  }
}
