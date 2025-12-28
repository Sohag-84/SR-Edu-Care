import 'package:sr_edu_care/core/utils/typedef.dart';
import 'package:sr_edu_care/feature/home/domain/entities/course_wrapper_entity.dart';

abstract interface class CourseRepository {
  ResultFuture<CourseWrapperEntity> fetchCourses({
    required int page,
    required int limit,
  });
}
