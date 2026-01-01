import 'package:sr_edu_care/core/entity/response_entity.dart';
import 'package:sr_edu_care/core/usecase/usecase.dart';
import 'package:sr_edu_care/core/utils/typedef.dart';
import 'package:sr_edu_care/feature/course/domain/repository/course_repository.dart';

class UpdateLectureUsecase
    implements Usecase<ResponseEntity, UpdateLectureParams> {
  final CourseRepository courseRepository;
  const UpdateLectureUsecase({required this.courseRepository});

  @override
  ResultFuture<ResponseEntity> call(UpdateLectureParams params) async {
    return await courseRepository.updateLecture(
      lectureId: params.lectureId,
      videoTitle: params.videoTitle,
      isPreview: params.isPreview,
      videoUrl: params.videoUrl,
    );
  }
}

class UpdateLectureParams {
  final String lectureId;
  final String videoTitle;
  final bool isPreview;
  final String videoUrl;
  const UpdateLectureParams({
    required this.lectureId,
    required this.videoTitle,
    required this.isPreview,
    required this.videoUrl,
  });
}
