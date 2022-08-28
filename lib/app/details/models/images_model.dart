import 'package:json_annotation/json_annotation.dart';

part 'images_model.g.dart';

@JsonSerializable()
class ImagesModel {

  String image;
  String paintId;
  String id;

  ImagesModel({
    required this.image,
    required this.paintId,
    required this.id,
  });

  factory ImagesModel.fromJson(Map<String, dynamic> json) => _$ImagesModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImagesModelToJson(this);
}