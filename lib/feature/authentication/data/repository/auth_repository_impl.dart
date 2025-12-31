import 'package:fpdart/fpdart.dart';
import 'package:sr_edu_care/core/entity/response_entity.dart';
import 'package:sr_edu_care/core/error_handler/api_error_handler.dart';
import 'package:sr_edu_care/core/utils/typedef.dart';
import 'package:sr_edu_care/feature/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:sr_edu_care/feature/authentication/domain/entities/auth_entity.dart';
import 'package:sr_edu_care/feature/authentication/domain/repository/auth_repository.dart';
import 'package:sr_edu_care/services/local_preference_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;
  const AuthRepositoryImpl({required this.remoteDatasource});

  @override
  ResultFuture<AuthEntity> userLogin({
    required String email,
    required String password,
    required String deviceToken,
  }) async {
    try {
      final result = await remoteDatasource.userLogin(
        email: email,
        password: password,
        deviceToken: deviceToken,
      );
      LocalPreferenceService.instance.setToken(token: result.token);
      LocalPreferenceService.instance.setUsername(username: result.user.name);
      LocalPreferenceService.instance.setEmail(email: result.user.email);
      LocalPreferenceService.instance.setUserRole(role: result.user.role);
      LocalPreferenceService.instance.setUserId(userId: result.user.id);
      return right(result);
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }

  @override
  ResultFuture<ResponseEntity> userSingup({
    required String name,
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      final result = await remoteDatasource.userSingup(
        name: name,
        email: email,
        password: password,
        role: role,
      );
      return right(result);
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }
}
