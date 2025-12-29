part of 'course_bloc.dart';

@immutable
sealed class CourseEvent {}

final class FetchCourses extends CourseEvent {
  final int page;
  final int limit;

  FetchCourses({required this.page, required this.limit});
}
