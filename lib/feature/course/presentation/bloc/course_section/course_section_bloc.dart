import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sr_edu_care/core/error_handler/failure_message_wrapper.dart';
import 'package:sr_edu_care/feature/course/domain/entities/course_section_entity.dart';
import 'package:sr_edu_care/feature/course/domain/usecases/get_course_section_usecase.dart';

part 'course_section_event.dart';
part 'course_section_state.dart';

class CourseSectionBloc extends Bloc<CourseSectionEvent, CourseSectionState> {
  final GetCourseSectionUsecase getCourseSectionUsecase;
  CourseSectionBloc({required this.getCourseSectionUsecase})
    : super(CourseSectionInitial()) {
    on<CourseSectionEvent>((event, emit) {});

    on<FetchedCourseSections>(_fetchedCourseSections);
  }

  FutureOr<void> _fetchedCourseSections(
    FetchedCourseSections event,
    Emitter<CourseSectionState> emit,
  ) async {
    emit(CourseSectionLoading());
    final result = await getCourseSectionUsecase.call(
      GetCourseSectionParams(courseId: event.courseId),
    );
    result.fold(
      (failure) =>
          emit(CourseSectionError(message: mapFailureToMessage(failure))),
      (sections) => emit(CourseSectionLoaded(courseSection: sections)),
    );
  }
}
