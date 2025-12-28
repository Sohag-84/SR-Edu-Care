import 'package:sr_edu_care/feature/home/domain/entities/course_entity.dart';

class CourseWrapperEntity {
  final bool success;
  final String message;
  final int totalCourses;
  final int currentPage;
  final int totalPages;
  final List<CourseEntity> courses;

  CourseWrapperEntity({
    required this.success,
    required this.message,
    required this.totalCourses,
    required this.currentPage,
    required this.totalPages,
    required this.courses,
  });
}
