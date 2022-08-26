
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:sotintas/app/cart/models/cart_model.dart';
import 'package:sotintas/app/shop/models/shop_model.dart';

part 'paint_repository.g.dart';

@RestApi(baseUrl: 'https://62968cc557b625860610144c.mockapi.io/')
abstract class PaintRepository {
  
  factory PaintRepository(Dio dio, {String baseUrl}) = _PaintRepository;

  @GET('/paint')
  Future<List<ShopModel>> findAll();

  @GET('/paint?page={id}&limit=10')
  Future<List<ShopModel>> getPage(@Path('id') String id);

  @GET('/paint?page=1&limit=10&search={text}')
  Future<List<ShopModel>> searchByName(@Path('text') String text);

  @GET('/cart')
  Future<List<CartModel>> getItensCart();

  @DELETE("/cart/{id}")
  Future<void> deleteItemCart(@Path('id') String id);
}

