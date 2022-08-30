import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sotintas/app/core/repository/app_repository.dart';
part 'cart_controller.g.dart';

// ignore: library_private_types_in_public_api
class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {
  final _repository = GetIt.I.get<AppRepository>();

  @observable
  ObservableList cartList = [].asObservable();

  @action
  loadCart() {
    if (cartList.isEmpty) {
      getItensCart();
    }
  }

  @action
  getItensCart() {
    _repository.getItensCart().then((value) {
      cartList.addAll(value);
    });
  }

  @action
  setQuantity({required String id, required int quantity}) {
    Map<String, dynamic> body = {'quantity': quantity};
    _repository.setQuantity(id, body);
  }

  @action
  removeItem({required String id}) {
    _repository.deleteItemCart(id);
  }
}
