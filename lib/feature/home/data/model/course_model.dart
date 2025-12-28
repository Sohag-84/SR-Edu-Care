import 'package:sr_edu_care/feature/home/domain/entities/course_entity.dart';

class CourseModel extends CourseEntity {
  const CourseModel({
    required super.id,
    required super.courseTitle,
    required super.subTitle,
    required super.description,
    required super.category,
    required super.courseLevel,
    required super.coursePrice,
    super.courseThumbnail,
    required super.sections,
    required super.enrolledStudents,
    required super.creator,
    required super.isPublished,
    required super.createdAt,
    required super.updatedAt,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['_id'],
      courseTitle: json['courseTitle'],
      subTitle: json['subTitle'],
      description: json['description'],
      category: json['category'],
      courseLevel: json['courseLevel'],
      coursePrice: json['coursePrice'],
      courseThumbnail: json['courseThumbnail'],
      sections: List<String>.from(json['sections'] ?? []),
      enrolledStudents: List<String>.from(json['enrolledStudents'] ?? []),
      creator: CreatorModel.fromJson(json['creator']),
      isPublished: json['isPublished'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'courseTitle': courseTitle,
      'subTitle': subTitle,
      'description': description,
      'category': category,
      'courseLevel': courseLevel,
      'coursePrice': coursePrice,
      'courseThumbnail': courseThumbnail,
      'sections': sections,
      'enrolledStudents': enrolledStudents,
      'creator': (creator as CreatorModel).toJson(),
      'isPublished': isPublished,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class CreatorModel extends CreatorEntity {
  const CreatorModel({
    required super.id,
    required super.name,
    required super.email,
    required super.photoUrl,
  });

  factory CreatorModel.fromJson(Map<String, dynamic> json) {
    return CreatorModel(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      photoUrl: json['photoUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'_id': id, 'name': name, 'email': email, 'photoUrl': photoUrl};
  }
}
