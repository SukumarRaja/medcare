import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'dash_board.dart';

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
    name.text = "${DashboardController.to.profileDetails.name ?? "N/A"}";
    email.text = "${DashboardController.to.profileDetails.email ?? "N/A"}";
    phone.text = "+91 ${DashboardController.to.profileDetails.phone ?? "N/A"}";
    gender.text = "${DashboardController.to.profileDetails.sex ?? "N/A"}";
    dob.text = "${DashboardController.to.profileDetails.birthdate ?? "N/A"}";
    address.text = "${DashboardController.to.profileDetails.address ?? "N/A"}";
  }
}
