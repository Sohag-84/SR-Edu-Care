class CourseSectionEntity {
  final String id;
  final String courseTitle;
  final String description;
  final CreatorEntity creator;
  final List<SectionEntity> sections;

  const CourseSectionEntity({
    required this.id,
    required this.courseTitle,
    required this.description,
    required this.creator,
    required this.sections,
  });
}

class CreatorEntity {
  final String id;
  final String name;
  final String email;
  final String photoUrl;

  const CreatorEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
  });
}

class SectionEntity {
  final String id;
  final String title;
  final String courseId;
  final List<LectureEntity> lectures;
  final int order;

  const SectionEntity({
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

  const LectureEntity({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.isPreview,
    required this.videoOrder,
  });
}
