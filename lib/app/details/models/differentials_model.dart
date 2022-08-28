import 'package:json_annotation/json_annotation.dart';

part 'differentials_model.g.dart';

@JsonSerializable()
class DifferentialsModel {
  String name;
  String id;
  String paintId;

  DifferentialsModel({
    required this.name,
    required this.id,
    required this.paintId,
  });

  factory DifferentialsModel.fromJson(Map<String, dynamic> json) =>
      _$DifferentialsModelFromJson(json);
  Map<String, dynamic> toJson() => _$DifferentialsModelToJson(this);
}
