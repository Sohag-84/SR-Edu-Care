import 'package:sr_edu_care/feature/home/domain/entities/slider_entity.dart';

class SliderModel extends SliderEntity {
  SliderModel({
    required super.id,
    required super.title,
    required super.imageUrl,
    required super.publicId,
    required super.isActive,
    required super.createdAt,
    required super.updatedAt,
    required super.v,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      id: json["_id"],
      title: json["title"],
      imageUrl: json["imageUrl"],
      publicId: json["publicId"],
      isActive: json["isActive"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}
