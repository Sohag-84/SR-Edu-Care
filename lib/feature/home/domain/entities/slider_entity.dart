class SliderEntity {
  SliderEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.publicId,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? title;
  final String? imageUrl;
  final String? publicId;
  final bool? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
}
