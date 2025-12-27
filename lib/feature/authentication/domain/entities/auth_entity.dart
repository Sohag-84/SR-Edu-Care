import 'user_entity.dart';

class AuthEntity {
  final bool status;
  final String message;
  final String token;
  final UserEntity user;

  const AuthEntity({
    required this.status,
    required this.message,
    required this.token,
    required this.user,
  });
}
