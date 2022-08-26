import 'package:json_annotation/json_annotation.dart';

part 'shop_model.g.dart';

@JsonSerializable()
class ShopModel {

  String name;
  String price;
  bool deliveryFree;
  String coverImage;
  String description;
  String id;

  ShopModel({
    required this.name,
    required this.price,
    required this.deliveryFree,
    required this.coverImage,
    required this.description,
    required this.id,
  });

  factory ShopModel.fromJson(Map<String, dynamic> json) => _$ShopModelFromJson(json);
  Map<String, dynamic> toJson() => _$ShopModelToJson(this);
}