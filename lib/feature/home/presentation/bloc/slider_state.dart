part of 'slider_bloc.dart';

@immutable
sealed class SliderState extends Equatable {
  const SliderState();

  @override
  List<Object?> get props => [];
}

final class SliderInitial extends SliderState {}

final class SliderLoading extends SliderState {}

final class SliderLoaded extends SliderState {
  final List<SliderEntity> sliders;
  const SliderLoaded({required this.sliders});

  @override
  List<Object?> get props => [sliders];
}

final class SliderFailure extends SliderState {
  final String error;
  const SliderFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
