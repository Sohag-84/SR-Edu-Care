import 'package:sr_edu_care/feature/course/domain/entities/course_entity.dart';

class CourseWrapperEntity {
  final bool status;
  final String message;
  final int totalCourses;
  final int currentPage;
  final int totalPages;
  final List<CourseEntity> courses;

  CourseWrapperEntity({
    required this.status,
    required this.message,
    required this.totalCourses,
    required this.currentPage,
    required this.totalPages,
    required this.courses,
  });
}
