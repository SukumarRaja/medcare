import 'package:get/get.dart';

class ProfileController extends GetxController{
  static ProfileController get to=>Get.put(ProfileController());

  final _isShowPassword = false.obs;

  get isShowPassword => _isShowPassword.value;

  set isShowPassword(value) {
    _isShowPassword.value = value;
  }
}