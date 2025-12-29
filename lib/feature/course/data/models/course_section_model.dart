import 'package:sr_edu_care/feature/course/domain/entities/course_section_entity.dart';

class CourseSectionModel extends CourseSectionEntity {
  CourseSectionModel({required super.id, required super.sections});

  factory CourseSectionModel.fromJson(Map<String, dynamic> json) {
    return CourseSectionModel(
      id: json['_id'],
      sections: (json['sections'] as List)
          .map((e) => SectionModel.fromJson(e))
          .toList(),
    );
  }
}

class SectionModel extends SectionEntity {
  SectionModel({
    required super.id,
    required super.title,
    required super.courseId,
    required super.lectures,
    required super.order,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) {
    return SectionModel(
      id: json['_id'],
      title: json['title'],
      courseId: json['course'],
      order: json['order'],
      lectures: (json['lectures'] as List)
          .map((e) => LectureModel.fromJson(e))
          .toList(),
    );
  }
}

class LectureModel extends LectureEntity {
  LectureModel({
    required super.id,
    required super.title,
    required super.videoUrl,
    required super.isPreview,
    required super.videoOrder,
  });

  factory LectureModel.fromJson(Map<String, dynamic> json) {
    return LectureModel(
      id: json['_id'],
      title: json['title'],
      videoUrl: json['videoUrl'] ?? '',
      isPreview: json['isPreview'] ?? false,
      videoOrder: json['videoOrder'] ?? 0,
    );
  }
}
