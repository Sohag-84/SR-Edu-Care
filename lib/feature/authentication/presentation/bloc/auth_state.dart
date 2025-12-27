part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final String message;
  final AuthEntity authEntity;
  const LoginSuccess({required this.message, required this.authEntity});

  @override
  List<Object> get props => [message, authEntity];
}

final class LoginFailure extends AuthState {
  final String errorMessage;
  const LoginFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {
  final String message;
  const RegisterSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

final class RegisterFailure extends AuthState {
  final String errorMessage;
  const RegisterFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
