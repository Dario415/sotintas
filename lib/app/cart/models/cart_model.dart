import 'package:json_annotation/json_annotation.dart';
import 'package:sotintas/app/shop/models/shop_model.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {

  int quantity;
  String id;
  ShopModel paint;

  CartModel({
    required this.quantity,
    required this.id,
    required this.paint,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}