part of 'course_bloc.dart';

@immutable
sealed class CourseState extends Equatable {
  const CourseState();
  @override
  List<Object?> get props => [];
}

final class CourseInitial extends CourseState {}

final class CourseLoading extends CourseState {}

final class CourseLoaded extends CourseState {
  final CourseWrapperEntity courseWapper;
  const CourseLoaded({required this.courseWapper});

  @override
  List<Object?> get props => [courseWapper];
}

final class CourseError extends CourseState {
  final String message;
  const CourseError({required this.message});

  @override
  List<Object?> get props => [message];
}
