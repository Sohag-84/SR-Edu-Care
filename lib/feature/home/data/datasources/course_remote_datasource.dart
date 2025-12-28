import 'package:sr_edu_care/feature/home/data/model/course_wrapper_model.dart';

abstract interface class CourseRemoteDatasource {
  Future<CourseWrapperModel> fetchCourses({
    required int page,
    required int limit,
  });
}
