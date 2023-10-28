import 'package:starter/config/app_config.dart';

/// Api constants
class ApiConstant {
  /// Private Constructor
  ApiConstant._();

  /// Base url from Environment
  static const String baseUrl = AppEnvironmentConfig.isProd ? prodUrl : devUrl;

  /// Production URL
  static const String prodUrl = 'https://jsonplaceholder.typicode.com';

  /// staging URL
  static const String devUrl = 'http://192.168.1.68:8080';

  /// Posts
  static const posts = '/posts';

  /// Posts detail
  static const comments = '/comments?';
}
