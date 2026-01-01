part of 'update_lecture_bloc.dart';

@immutable
sealed class UpdateLectureState extends Equatable {
  const UpdateLectureState();
  @override
  List<Object?> get props => [];
}

final class UpdateLectureInitial extends UpdateLectureState {}

final class UpdateLectureLoading extends UpdateLectureState {}

final class UpdateLectureSuccess extends UpdateLectureState {
  final ResponseEntity response;
  const UpdateLectureSuccess({required this.response});
  @override
  List<Object?> get props => [response];
}

final class UpdateLectureFailure extends UpdateLectureState {
  final String error;
  const UpdateLectureFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
