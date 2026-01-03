import 'package:sr_edu_care/feature/course/data/models/course_model.dart';
import 'package:sr_edu_care/feature/course/domain/entities/course_wrapper_entity.dart';

class CourseWrapperModel extends CourseWrapperEntity {
  CourseWrapperModel({
    required super.courses,
    required super.currentPage,
    required super.totalPages,
    required super.totalCourses,
    required super.status,
    required super.message,
  });
  factory CourseWrapperModel.fromJson(Map<String, dynamic> json) {
    return CourseWrapperModel(
      status: json['status'],
      message: json['message'],
      totalCourses: json['totalCourses'],
      currentPage: json['currentPage'],
      totalPages: json['totalPages'],
      courses: (json['data'] as List)
          .map((e) => CourseModel.fromJson(e))
          .toList(),
    );
  }
}
