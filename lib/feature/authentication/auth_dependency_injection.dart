import 'package:sr_edu_care/feature/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:sr_edu_care/feature/authentication/data/datasources/auth_remote_datasource_impl.dart';
import 'package:sr_edu_care/feature/authentication/data/repository/auth_repository_impl.dart';
import 'package:sr_edu_care/feature/authentication/domain/repository/auth_repository.dart';
import 'package:sr_edu_care/feature/authentication/domain/usecases/user_login_usecase.dart';
import 'package:sr_edu_care/feature/authentication/domain/usecases/user_registration_usecase.dart';
import 'package:sr_edu_care/feature/authentication/presentation/bloc/auth_bloc.dart';
import 'package:sr_edu_care/service_locator.dart';

void authDependencyInjection() {
  //Datasource
  sl
    ..registerFactory<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl(apiService: sl.call()),
    )
    //Repository
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(remoteDatasource: sl.call()),
    )
    //Usecase
    ..registerFactory(() => UserRegistrationUsecase(authRepository: sl.call()))
    ..registerFactory(() => UserLoginUsecase(authRepository: sl.call()))
    //Bloc
    ..registerLazySingleton<AuthBloc>(
      () => AuthBloc(
        userRegistrationUsecase: sl.call(),
        userLoginUsecase: sl.call(),
      ),
    );
}
