part of 'course_section_bloc.dart';

@immutable
sealed class CourseSectionState extends Equatable {
  const CourseSectionState();
  @override
  List<Object?> get props => [];
}

final class CourseSectionInitial extends CourseSectionState {}

final class CourseSectionLoading extends CourseSectionState {}

final class CourseSectionLoaded extends CourseSectionState {
  final CourseSectionEntity courseSection;
  const CourseSectionLoaded({required this.courseSection});

  @override
  List<Object?> get props => [courseSection];
}

final class CourseSectionError extends CourseSectionState {
  final String message;
  const CourseSectionError({required this.message});

  @override
  List<Object?> get props => [message];
}
