import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:sotintas/app/cart/models/cart_model.dart';
import 'package:sotintas/app/details/models/differentials_model.dart';
import 'package:sotintas/app/details/models/images_model.dart';
import 'package:sotintas/app/profile/models/profile_model.dart';
import 'package:sotintas/app/registration/models/registration_model.dart';
import 'package:sotintas/app/shop/models/shop_model.dart';

part 'app_repository.g.dart';

@RestApi(baseUrl: 'https://62968cc557b625860610144c.mockapi.io/')
abstract class AppRepository {
  factory AppRepository(Dio dio, {String baseUrl}) = _AppRepository;

  @GET('/paint')
  Future<List<ShopModel>> getAll();

  @GET('/login')
  Future<String> authentication(@Body() Map<String, dynamic> body);

  @GET('/paint?page={id}&limit=10')
  Future<List<ShopModel>> getPage(@Path('id') String id);

  @GET('/paint/{id}/image')
  Future<List<ImagesModel>> getImages(@Path('id') String id);

  @GET('/paint/{id}/differential')
  Future<List<DifferentialsModel>> getDifferentials(@Path('id') String id);

  @GET('/paint?page=1&limit=10&search={text}')
  Future<List<ShopModel>> searchByName(@Path('text') String text);

  @GET('/cart')
  Future<List<CartModel>> getItensCart();

  @GET('/profile')
  Future<ProfileModel> getProfile();

  @GET('/logout')
  Future<void> logout();

  @DELETE("/cart/{id}")
  Future<void> deleteItemCart(@Path('id') String id);

  @PUT("/cart/{id}")
  Future<void> setQuantity(
      @Path('id') String id, @Body() Map<String, dynamic> body);

  @POST("/user")
  Future<void> sendNewUser(@Body() RegistrationModel body);
}