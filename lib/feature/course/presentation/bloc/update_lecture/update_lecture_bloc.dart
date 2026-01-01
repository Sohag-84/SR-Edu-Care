import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sr_edu_care/core/entity/response_entity.dart';
import 'package:sr_edu_care/core/error_handler/failure_message_wrapper.dart';
import 'package:sr_edu_care/feature/course/domain/usecases/update_lecture_usecase.dart';

part 'update_lecture_event.dart';
part 'update_lecture_state.dart';

class UpdateLectureBloc extends Bloc<UpdateLectureEvent, UpdateLectureState> {
  final UpdateLectureUsecase updateLectureUsecase;

  UpdateLectureBloc({required this.updateLectureUsecase})
    : super(UpdateLectureInitial()) {
    on<UpdatedLecture>(_updatedLecture);
  }

  FutureOr<void> _updatedLecture(
    UpdatedLecture event,
    Emitter<UpdateLectureState> emit,
  ) async {
    emit(UpdateLectureLoading());
    final result = await updateLectureUsecase.call(
      UpdateLectureParams(
        lectureId: event.lectureId,
        videoTitle: event.videoTitle,
        isPreview: event.isPreview,
        videoUrl: event.videoUrl,
      ),
    );

    result.fold(
      (failure) =>
          emit(UpdateLectureFailure(error: mapFailureToMessage(failure))),
      (response) => emit(UpdateLectureSuccess(response: response)),
    );
  }
}
