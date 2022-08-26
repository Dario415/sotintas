import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sotintas/app/core/repository/paint_repository.dart';
part 'cart_controller.g.dart';

class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {

  final _repository = GetIt.I.get<PaintRepository>();
  
  @observable
  ObservableList cartList = [].asObservable();


  @action
  getCart(){
    _repository.getItensCart().then((value){
      cartList.addAll(value);
      print(value[1].paint.name);
    });
  }
}