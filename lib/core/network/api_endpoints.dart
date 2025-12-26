class ApiEndpoints {
  // Base
  static const String baseUrl = '';

  // Auth (NO TOKEN)
  static const String login = '';
  static const String register = '';

  // Protected APIs

  /// APIs that DON'T need token
  static const List<String> publicApis = [login, register];
}
