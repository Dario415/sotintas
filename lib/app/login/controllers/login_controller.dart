import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sotintas/app/core/data/local_data.dart';
import 'package:sotintas/app/core/repository/app_repository.dart';
part 'login_controller.g.dart';

// ignore: library_private_types_in_public_api
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final _repository = GetIt.I.get<AppRepository>();
  final _localData = GetIt.I.get<LocalData>();

  @observable
  bool isLoading = false;

  @action
  _saveToken(String token) {
    _localData.setToken(token);
  }

  @action
  authentication() async {
    isLoading = true;
    final token = await _repository
        .authentication({'email': 'dario@loomi.com.br', 'password': '123456'});
    _saveToken(token['access-token']!);
  }
}
