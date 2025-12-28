class CourseEntity {
  final String id;
  final String courseTitle;
  final String subTitle;
  final String description;
  final String category;
  final String courseLevel;
  final int coursePrice;
  final String? courseThumbnail;
  final List<String> sections;
  final List<String> enrolledStudents;
  final CreatorEntity creator;
  final bool isPublished;
  final DateTime createdAt;
  final DateTime updatedAt;

  const CourseEntity({
    required this.id,
    required this.courseTitle,
    required this.subTitle,
    required this.description,
    required this.category,
    required this.courseLevel,
    required this.coursePrice,
    this.courseThumbnail,
    required this.sections,
    required this.enrolledStudents,
    required this.creator,
    required this.isPublished,
    required this.createdAt,
    required this.updatedAt,
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
