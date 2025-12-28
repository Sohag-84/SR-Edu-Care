import 'package:sr_edu_care/core/usecase/usecase.dart';
import 'package:sr_edu_care/core/utils/typedef.dart';
import 'package:sr_edu_care/feature/home/domain/entities/course_wrapper_entity.dart';
import 'package:sr_edu_care/feature/home/domain/repository/course_repository.dart';

class GetCourseUsecase
    implements Usecase<CourseWrapperEntity, GetCourseParams> {
  final CourseRepository courseRepository;
  const GetCourseUsecase({required this.courseRepository});

  @override
  ResultFuture<CourseWrapperEntity> call(GetCourseParams params) async {
    return await courseRepository.fetchCourses(
      page: params.page,
      limit: params.limit,
    );
  }
}

class GetCourseParams {
  final int page;
  final int limit;

  GetCourseParams({required this.page, required this.limit});
}
