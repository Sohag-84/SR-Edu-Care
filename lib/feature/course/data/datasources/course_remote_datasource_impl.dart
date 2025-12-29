import 'package:sr_edu_care/core/network/api_endpoints.dart';
import 'package:sr_edu_care/core/network/api_services.dart';
import 'package:sr_edu_care/feature/course/data/datasources/course_remote_datasource.dart';
import 'package:sr_edu_care/feature/course/data/models/course_section_model.dart';
import 'package:sr_edu_care/feature/course/data/models/course_wrapper_model.dart';

class CourseRemoteDatasourceImpl implements CourseRemoteDatasource {
  final ApiService apiService;
  const CourseRemoteDatasourceImpl({required this.apiService});

  @override
  Future<CourseWrapperModel> fetchCourses({
    required int page,
    required int limit,
  }) async {
    final response = await apiService.get(
      ApiEndpoints.getPublishedCourses,
      query: {'page': page, 'limit': limit},
    );

    final wrapper = CourseWrapperModel.fromJson(response.data);

    return wrapper;
  }

  @override
  Future<CourseSectionModel> fetchCourseSections({
    required String courseId,
  }) async {
    final response = await apiService.get(
      ApiEndpoints.getCourseSections(courseId),
    );

    return CourseSectionModel.fromJson(response.data['data']);
  }
}
