import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sr_edu_care/core/error_handler/failure_message_wrapper.dart';
import 'package:sr_edu_care/core/usecase/usecase.dart';
import 'package:sr_edu_care/feature/home/domain/entities/slider_entity.dart';
import 'package:sr_edu_care/feature/home/domain/usecases/get_slider_usecase.dart';

part 'slider_event.dart';
part 'slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  final GetSliderUsecase sliderUsecase;
  SliderBloc({required this.sliderUsecase}) : super(SliderInitial()) {
    on<FetchedSlider>(_fetchedSlider);
  }

  Future<void> _fetchedSlider(
    FetchedSlider event,
    Emitter<SliderState> emit,
  ) async {
    emit(SliderLoading());
    final result = await sliderUsecase.call(NoParams());

    result.fold(
      (failure) => emit(SliderFailure(error: mapFailureToMessage(failure))),
      (sliders) => emit(SliderLoaded(sliders: sliders)),
    );
  }
}
