part of 'instructor_course_bloc.dart';

@immutable
sealed class InstructorCourseState extends Equatable {
  const InstructorCourseState();
  @override
  List<Object?> get props => [];
}

final class InstructorCourseInitial extends InstructorCourseState {}

final class InstructorCourseLoading extends InstructorCourseState {}

final class InstructorCourseLoaded extends InstructorCourseState {
  final List<CourseEntity> courseList;
  const InstructorCourseLoaded({required this.courseList});

  @override
  List<Object?> get props => [courseList];
}

final class InstructorCourseFailure extends InstructorCourseState {
  final String error;
  const InstructorCourseFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
