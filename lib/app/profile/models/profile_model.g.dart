// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      email: json['email'] as String,
      avatar: json['avatar'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'avatar': instance.avatar,
    };
