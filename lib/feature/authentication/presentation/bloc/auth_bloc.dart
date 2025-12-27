import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sr_edu_care/core/error_handler/failure_message_wrapper.dart';
import 'package:sr_edu_care/feature/authentication/domain/entities/auth_entity.dart';
import 'package:sr_edu_care/feature/authentication/domain/usecases/user_login_usecase.dart';
import 'package:sr_edu_care/feature/authentication/domain/usecases/user_registration_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRegistrationUsecase userRegistrationUsecase;
  final UserLoginUsecase userLoginUsecase;
  AuthBloc({
    required this.userRegistrationUsecase,
    required this.userLoginUsecase,
  }) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});

    on<RegisterEvent>(_registerEvent);
    on<LoginEvent>(_loginEvent);
  }

  Future<void> _registerEvent(
    RegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(RegisterLoading());
    final result = await userRegistrationUsecase(
      UserRegisterParams(
        name: event.name,
        email: event.email,
        password: event.password,
        role: 'student',
      ),
    );

    result.fold(
      (failure) =>
          emit(RegisterFailure(errorMessage: mapFailureToMessage(failure))),
      (user) => emit(RegisterSuccess(message: user.message)),
    );
  }

  Future<void> _loginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoading());
    final result = await userLoginUsecase(
      UserLoginParams(
        email: event.email,
        password: event.password,
        deviceToken: '',
      ),
    );
    result.fold(
      (failure) =>
          emit(LoginFailure(errorMessage: mapFailureToMessage(failure))),
      (authEntity) {
        emit(LoginSuccess(message: "Login Successful", authEntity: authEntity));
      },
    );
  }
}
