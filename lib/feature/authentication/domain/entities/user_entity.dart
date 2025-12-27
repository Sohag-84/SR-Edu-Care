class UserEntity {
  final String id;
  final String name;
  final String email;
  final String role;
  final List<String> enrolledCourses;
  final String photoUrl;
  final String photoPublicId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.enrolledCourses,
    required this.photoUrl,
    required this.photoPublicId,
    required this.createdAt,
    required this.updatedAt,
  });
}
