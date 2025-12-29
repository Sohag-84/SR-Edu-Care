class CourseSectionEntity {
  final String id;
  final List<SectionEntity> sections;

  CourseSectionEntity({required this.id, required this.sections});
}

class SectionEntity {
  final String id;
  final String title;
  final String courseId;
  final List<LectureEntity> lectures;
  final int order;

  SectionEntity({
    required this.id,
    required this.title,
    required this.courseId,
    required this.lectures,
    required this.order,
  });
}

class LectureEntity {
  final String id;
  final String title;
  final String videoUrl;
  final bool isPreview;
  final int videoOrder;

  LectureEntity({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.isPreview,
    required this.videoOrder,
  });
}
