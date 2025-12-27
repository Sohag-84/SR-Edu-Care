import 'package:sr_edu_care/core/entity/response_entity.dart';
import 'package:sr_edu_care/core/utils/typedef.dart';
import 'package:sr_edu_care/feature/authentication/domain/entities/auth_entity.dart';

abstract interface class AuthRepository {
  ResultFuture<ResponseEntity> userSingup({
    required String name,
    required String email,
    required String password,
    required String role,
  });

  ResultFuture<AuthEntity> userLogin({
    required String email,
    required String password,
    required String deviceToken,
  });
}
