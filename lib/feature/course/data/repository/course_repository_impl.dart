import 'package:fpdart/fpdart.dart';
import 'package:sr_edu_care/core/entity/response_entity.dart';
import 'package:sr_edu_care/core/error_handler/api_error_handler.dart';
import 'package:sr_edu_care/core/utils/typedef.dart';
import 'package:sr_edu_care/feature/course/data/datasources/course_remote_datasource.dart';
import 'package:sr_edu_care/feature/course/domain/entities/course_entity.dart';
import 'package:sr_edu_care/feature/course/domain/entities/course_section_entity.dart';
import 'package:sr_edu_care/feature/course/domain/entities/course_wrapper_entity.dart';
import 'package:sr_edu_care/feature/course/domain/repository/course_repository.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseRemoteDatasource courseRemoteDatasource;
  const CourseRepositoryImpl({required this.courseRemoteDatasource});

  @override
  ResultFuture<CourseWrapperEntity> fetchCourses({
    required int page,
    required int limit,
  }) async {
    try {
      final courses = await courseRemoteDatasource.fetchCourses(
        page: page,
        limit: limit,
      );
      return right(courses);
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }

  @override
  ResultFuture<CourseSectionEntity> fetchCourseSections({
    required String courseId,
  }) async {
    try {
      final sections = await courseRemoteDatasource.fetchCourseSections(
        courseId: courseId,
      );
      return right(sections);
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }

  @override
  ResultFuture<List<CourseEntity>> getInstructorCourses() async {
    try {
      final result = await courseRemoteDatasource.getInstructorCourses();
      return right(result);
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }

  @override
  ResultFuture<ResponseEntity> updateLecture({
    required String lectureId,
    required String videoTitle,
    required bool isPreview,
    required String videoUrl,
  }) async {
    try {
      final result = await courseRemoteDatasource.updateLecture(
        lectureId: lectureId,
        videoTitle: videoTitle,
        isPreview: isPreview,
        videoUrl: videoUrl,
      );
      return right(result);
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }
}
