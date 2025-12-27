import 'package:sr_edu_care/core/entity/response_entity.dart';
import 'package:sr_edu_care/core/usecase/usecase.dart';
import 'package:sr_edu_care/core/utils/typedef.dart';
import 'package:sr_edu_care/feature/authentication/domain/repository/auth_repository.dart';

class UserRegistrationUsecase
    implements Usecase<ResponseEntity, UserRegisterParams> {
  final AuthRepository authRepository;
  const UserRegistrationUsecase({required this.authRepository});

  @override
  ResultFuture<ResponseEntity> call(UserRegisterParams params) async {
    return await authRepository.userSingup(
      name: params.name,
      email: params.email,
      password: params.password,
      role: params.role,
    );
  }
}

class UserRegisterParams {
  final String name;
  final String email;
  final String password;
  final String role;

  const UserRegisterParams({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
  });
}
