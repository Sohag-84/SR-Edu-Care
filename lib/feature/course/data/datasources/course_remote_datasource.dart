import 'package:sr_edu_care/feature/course/data/models/course_model.dart';
import 'package:sr_edu_care/feature/course/data/models/course_section_model.dart';
import 'package:sr_edu_care/feature/course/data/models/course_wrapper_model.dart';

abstract interface class CourseRemoteDatasource {
  Future<CourseWrapperModel> fetchCourses({
    required int page,
    required int limit,
  });

  Future<CourseSectionModel> fetchCourseSections({required String courseId});

  Future<List<CourseModel>> getInstructorCourses();
}
