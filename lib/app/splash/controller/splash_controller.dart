import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sotintas/app/core/data/local_data.dart';
part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  final _locaData = GetIt.I.get<LocalData>();

  Future<bool> verifyToken() async {
    final data = await _locaData.readToken();
    return data == null;
  }
}
