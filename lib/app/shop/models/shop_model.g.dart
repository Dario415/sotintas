// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopModel _$ShopModelFromJson(Map<String, dynamic> json) => ShopModel(
      name: json['name'] as String,
      price: json['price'] as String,
      deliveryFree: json['deliveryFree'] as bool,
      coverImage: json['coverImage'] as String,
      description: json['description'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$ShopModelToJson(ShopModel instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'deliveryFree': instance.deliveryFree,
      'coverImage': instance.coverImage,
      'description': instance.description,
      'id': instance.id,
    };
