import 'package:sr_edu_care/core/usecase/usecase.dart';
import 'package:sr_edu_care/core/utils/typedef.dart';
import 'package:sr_edu_care/feature/authentication/domain/entities/auth_entity.dart';
import 'package:sr_edu_care/feature/authentication/domain/repository/auth_repository.dart';

class UserLoginUsecase implements Usecase<AuthEntity, UserLoginParams> {
  final AuthRepository authRepository;
  const UserLoginUsecase({required this.authRepository});

  @override
  ResultFuture<AuthEntity> call(UserLoginParams params) async {
    return await authRepository.userLogin(
      email: params.email,
      password: params.password,
      deviceToken: params.deviceToken,
    );
  }
}

class UserLoginParams {
  final String email;
  final String password;
  final String deviceToken;

  const UserLoginParams({
    required this.email,
    required this.password,
    required this.deviceToken,
  });
}
