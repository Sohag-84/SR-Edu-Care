import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sr_edu_care/core/error_handler/failure_message_wrapper.dart';
import 'package:sr_edu_care/core/usecase/usecase.dart';
import 'package:sr_edu_care/feature/course/domain/entities/course_entity.dart';
import 'package:sr_edu_care/feature/course/domain/usecases/get_instructor_courses_usecase.dart';

part 'instructor_course_event.dart';
part 'instructor_course_state.dart';

class InstructorCourseBloc
    extends Bloc<InstructorCourseEvent, InstructorCourseState> {
  final GetInstructorCoursesUsecase instructorCoursesUsecase;

  InstructorCourseBloc({required this.instructorCoursesUsecase})
    : super(InstructorCourseInitial()) {
    on<InstructorCourseFetched>(_instructorCourseFetched);
  }

  FutureOr<void> _instructorCourseFetched(
    InstructorCourseFetched event,
    Emitter<InstructorCourseState> emit,
  ) async {
    emit(InstructorCourseLoading());
    final result = await instructorCoursesUsecase.call(NoParams());

    result.fold(
      (failure) =>
          emit(InstructorCourseFailure(error: mapFailureToMessage(failure))),
      (courseList) => emit(InstructorCourseLoaded(courseList: courseList)),
    );
  }
}
