// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      quantity: json['quantity'] as int,
      id: json['id'] as String,
      paint: ShopModel.fromJson(json['paint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'quantity': instance.quantity,
      'id': instance.id,
      'paint': instance.paint,
    };
