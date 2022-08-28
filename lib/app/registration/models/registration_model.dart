import 'package:json_annotation/json_annotation.dart';

part 'registration_model.g.dart';

@JsonSerializable()
class RegistrationModel {
  String name;
  String email;
  String password;

  RegistrationModel({
    required this.name,
    required this.email,
    required this.password,
  });

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegistrationModelToJson(this);
}
