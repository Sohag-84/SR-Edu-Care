part of 'instructor_course_bloc.dart';

@immutable
sealed class InstructorCourseEvent {
  const InstructorCourseEvent();
}

final class InstructorCourseFetched extends InstructorCourseEvent {
  const InstructorCourseFetched();
}
