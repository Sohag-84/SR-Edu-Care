part of 'course_section_bloc.dart';

@immutable
sealed class CourseSectionEvent {}

final class FetchedCourseSections extends CourseSectionEvent {
  final String courseId;
  FetchedCourseSections({required this.courseId});
}
