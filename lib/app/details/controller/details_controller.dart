import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sotintas/app/shop/models/shop_model.dart';

import '../../core/repository/app_repository.dart';
part 'details_controller.g.dart';

// ignore: library_private_types_in_public_api
class DetailsController = _DetailsControllerBase with _$DetailsController;

abstract class _DetailsControllerBase with Store {
  final _repository = GetIt.I.get<AppRepository>();

  @observable
  ObservableList imagesList = [].asObservable();

  @observable
  ObservableList differentialsList = [].asObservable();

  @action
  getImages(String id) {
    _repository.getImages(id).then((value) {
      imagesList.clear();
      imagesList.addAll(value);
    });
  }

  @action
  getDifferentials(String id) {
    _repository.getDifferentials(id).then((value) {
      differentialsList.clear();
      differentialsList.addAll(value);
    });
  }

  @action
  addToCart({required String id}) {
    _repository.getById(id).then((value) {
      ShopModel paint = value;
      _repository.addToCart({
        'quantity': 1,
        'paint': paint,
      });
    });
  }
}
