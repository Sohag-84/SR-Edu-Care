import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoints {
  // Base
  static final String baseUrl = dotenv.env['BASE_URL']!;

  // Auth (NO TOKEN)
  static const String login = 'user/login';
  static const String register = 'user/register';
  static const String getPublishedCourses = 'course/publish-course/get';

  // Protected APIs
  static String getCourseSections(String courseId) => 'section/$courseId/get';
  static String getInstructorCourses = "course/instructor-courses";
  static String updateLecture = "lecture/update";

  /// APIs that DON'T need token
  static const List<String> publicApis = [login, register, getPublishedCourses];
}
