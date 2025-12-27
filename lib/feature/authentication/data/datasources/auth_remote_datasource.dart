import 'package:sr_edu_care/core/model/response_model.dart';
import 'package:sr_edu_care/feature/authentication/data/models/auth_model.dart';

abstract interface class AuthRemoteDatasource {
  Future<ResponseModel> userSingup({
    required String name,
    required String email,
    required String password,
    required String role,
  });

  Future<AuthModel> userLogin({
    required String email,
    required String password,
    required String deviceToken,
  });
}
