import 'package:sr_edu_care/core/usecase/usecase.dart';
import 'package:sr_edu_care/core/utils/typedef.dart';
import 'package:sr_edu_care/feature/course/domain/entities/course_section_entity.dart';
import 'package:sr_edu_care/feature/course/domain/repository/course_repository.dart';

class GetCourseSectionUsecase
    implements Usecase<CourseSectionEntity, GetCourseSectionParams> {
  final CourseRepository courseRepository;
  const GetCourseSectionUsecase({required this.courseRepository});

  @override
  ResultFuture<CourseSectionEntity> call(GetCourseSectionParams params) async {
    return await courseRepository.fetchCourseSections(
      courseId: params.courseId,
    );
  }
}

class GetCourseSectionParams {
  final String courseId;

  GetCourseSectionParams({required this.courseId});
}
