import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sotintas/app/core/repository/paint_repository.dart';
part 'shop_controller.g.dart';

// ignore: library_private_types_in_public_api
class ShopController = _ShopControllerBase with _$ShopController;

abstract class _ShopControllerBase with Store {
  int _page = 1;
  final _repository = GetIt.I.get<PaintRepository>();

  @observable
  bool isLoading = false;

  @observable
  bool onlyDeliveryFree = false;

  @observable
  ObservableList paintList = [].asObservable();

  @action
  searchPaints(String text) {
    if(text.isEmpty){
      getPaints();
    }
    isLoading = true;
    paintList.clear();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      _repository.searchByName(text).then((value) {
        paintList.addAll(value);
        isLoading = false;
      });
    });
  }

  @action
  deliveryFreeOrNot(bool? check) {
    onlyDeliveryFree = check!;
    paintList.clear();
    _page = 1;
    getPaints();
  }

  @action
  getPaints() {
    if (onlyDeliveryFree) {
      getDeliveryFree();
    } else {
      getAllPaints();
    }
  }

  @action
  void getAllPaints() {
    isLoading = true;
    Future.delayed(const Duration(seconds: 1)).then((value) {
      _repository.getPage(_page.toString()).then((value) {
        paintList.addAll(value);
        isLoading = false;
        _page++;
      });
    });
  }

  @action
  getDeliveryFree() {
    isLoading = true;
    _repository.getPage(_page.toString()).then((value) {
      for (var element in value) {
        if (element.deliveryFree) {
          paintList.add(element);
        }
        _page++;
      }
    });
    isLoading = false;
  }
}
