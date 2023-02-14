import 'package:medcare/app/config/config.dart';

class ApiService {
  // auth
  static const login = "${AppConfig.baseUrl}action=login";
  static const register = "${AppConfig.baseUrl}action=register";

  //profile
  static const getProfile = "${AppConfig.baseUrl}getprofile=";
}
