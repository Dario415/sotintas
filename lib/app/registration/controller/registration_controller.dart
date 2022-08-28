import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sotintas/app/core/repository/app_repository.dart';
import 'package:sotintas/app/registration/models/registration_model.dart';
part 'registration_controller.g.dart';

// ignore: library_private_types_in_public_api
class RegistrationController = _RegistrationControllerBase
    with _$RegistrationController;

abstract class _RegistrationControllerBase with Store {
  final _repository = GetIt.I.get<AppRepository>();

  @observable
  bool isLoading = false;

  @action
  sendUser({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    if (password == confirmPassword) {
      _repository.sendNewUser(
          RegistrationModel(name: name, email: email, password: password));
    }
  }
}
