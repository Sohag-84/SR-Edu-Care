part of 'update_lecture_bloc.dart';

@immutable
sealed class UpdateLectureEvent {}

final class UpdatedLecture extends UpdateLectureEvent {
  final String lectureId;
  final String videoTitle;
  final bool isPreview;
  final String videoUrl;

  UpdatedLecture({
    required this.lectureId,
    required this.videoTitle,
    required this.isPreview,
    required this.videoUrl,
  });
}
