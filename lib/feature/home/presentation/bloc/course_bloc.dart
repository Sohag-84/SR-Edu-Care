import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sr_edu_care/core/error_handler/failure_message_wrapper.dart';
import 'package:sr_edu_care/feature/home/domain/entities/course_wrapper_entity.dart';
import 'package:sr_edu_care/feature/home/domain/usecases/get_course_usecase.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetCourseUsecase getCourseUsecase;
  CourseBloc({required this.getCourseUsecase}) : super(CourseInitial()) {
    on<CourseEvent>((event, emit) {});

    on<FetchCourses>(_fetchCourses);
  }

  Future<void> _fetchCourses(
    FetchCourses event,
    Emitter<CourseState> emit,
  ) async {
    emit(CourseLoading());
    final result = await getCourseUsecase.call(
      GetCourseParams(page: event.page, limit: event.limit),
    );
    result.fold(
      (failure) => emit(CourseError(message: mapFailureToMessage(failure))),
      (courses) => emit(CourseLoaded(courseWapper: courses)),
    );
  }
}
