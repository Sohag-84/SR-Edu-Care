import 'package:sr_edu_care/core/entity/response_entity.dart';
import 'package:sr_edu_care/core/utils/typedef.dart';
import 'package:sr_edu_care/feature/course/domain/entities/course_entity.dart';
import 'package:sr_edu_care/feature/course/domain/entities/course_section_entity.dart';
import 'package:sr_edu_care/feature/course/domain/entities/course_wrapper_entity.dart';

abstract interface class CourseRepository {
  ResultFuture<CourseWrapperEntity> fetchCourses({
    required int page,
    required int limit,
  });

  ResultFuture<CourseSectionEntity> fetchCourseSections({
    required String courseId,
  });

  ResultFuture<List<CourseEntity>> getInstructorCourses();

  ResultFuture<ResponseEntity> updateLecture({
    required String lectureId,
    required String videoTitle,
    required bool isPreview,
    required String videoUrl,
  });
}
