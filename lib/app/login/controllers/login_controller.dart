import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sotintas/app/core/repository/app_repository.dart';
part 'login_controller.g.dart';

// ignore: library_private_types_in_public_api
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final _repository = GetIt.I.get<AppRepository>();

  @observable
  bool isLoading = false;

  @action
  authentication() {
    isLoading = true;
    Future.delayed(Duration(seconds: 1)).then((value) {
      _repository.authentication(
          {'email': 'dario@loomi.com.br', 'password': '123456'}).then((value) {
        isLoading = false;
      });
    });
  }
}
