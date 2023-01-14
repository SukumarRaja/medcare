import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.put(ProfileController());

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController address = TextEditingController();

  final _isShowPassword = false.obs;

  get isShowPassword => _isShowPassword.value;

  set isShowPassword(value) {
    _isShowPassword.value = value;
  }

  data() {
    name.text = "Test Name";
    email.text = "test@gmail.com";
    phone.text = "+91 8698923685";
    gender.text = "Female";
    dob.text = "25/12/1997";
    address.text = "Namakkal";
  }
}
