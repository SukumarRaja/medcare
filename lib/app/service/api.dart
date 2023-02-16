import 'package:primedix/app/config/config.dart';

class ApiService {
  // auth
  static const login = "${AppConfig.baseUrl}action=login";
  static const register = "${AppConfig.baseUrl}action=register";

  //profile
  static const getProfile = "${AppConfig.baseUrl}getprofile=";
  static const updateProfile = "${AppConfig.baseUrl}action=updateprofile";

  //forgot password
  static const validateEmail = "${AppConfig.baseUrl}action=validateEmail";

  //update password
  static const updatePassword = "${AppConfig.baseUrl}action=updatePassword";
}
