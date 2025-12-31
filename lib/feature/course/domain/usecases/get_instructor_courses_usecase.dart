import 'package:sr_edu_care/core/usecase/usecase.dart';
import 'package:sr_edu_care/core/utils/typedef.dart';
import 'package:sr_edu_care/feature/course/domain/entities/course_entity.dart';
import 'package:sr_edu_care/feature/course/domain/repository/course_repository.dart';

class GetInstructorCoursesUsecase
    implements Usecase<List<CourseEntity>, NoParams> {
  final CourseRepository courseRepository;
  const GetInstructorCoursesUsecase({required this.courseRepository});

  @override
  ResultFuture<List<CourseEntity>> call(NoParams params) async {
    return await courseRepository.getInstructorCourses();
  }
}
