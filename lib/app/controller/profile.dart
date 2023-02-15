import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repository/profile.dart';
import '../ui/widgets/common_print.dart';
import '../ui/widgets/common_snackbar.dart';
import 'dash_board.dart';
import 'file.dart';
import 'main.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.put(ProfileController());

  final repository = ProfileRepository();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController address = TextEditingController();

  TextEditingController name1 = TextEditingController();
  TextEditingController email1 = TextEditingController();
  TextEditingController phone1 = TextEditingController();
  TextEditingController gender1 = TextEditingController();
  TextEditingController dob1 = TextEditingController();
  TextEditingController address1 = TextEditingController();

  final updateKey = GlobalKey<FormState>();

  final _isShowPassword = false.obs;

  get isShowPassword => _isShowPassword.value;

  set isShowPassword(value) {
    _isShowPassword.value = value;
  }

  final _updateLoading = false.obs;

  get updateLoading => _updateLoading.value;

  set updateLoading(value) {
    _updateLoading.value = value;
  }

  final _isDataChangedForUpdate = false.obs;

  get isDataChangedForUpdate => _isDataChangedForUpdate.value;

  set isDataChangedForUpdate(value) {
    _isDataChangedForUpdate.value = value;
  }

  data() {
    name.text = "${DashboardController.to.profileDetails.name ?? "N/A"}";
    email.text = "${DashboardController.to.profileDetails.email ?? "N/A"}";
    phone.text = "${DashboardController.to.profileDetails.phone ?? "N/A"}";
    gender.text = "${DashboardController.to.profileDetails.sex ?? "N/A"}";
    dob.text = "${DashboardController.to.profileDetails.birthdate ?? "N/A"}";
    address.text = "${DashboardController.to.profileDetails.address ?? "N/A"}";
  }

  checkedDataForUpdatePurpose() {
    name1.text = "${DashboardController.to.profileDetails.name ?? "N/A"}";
    email1.text = "${DashboardController.to.profileDetails.email ?? "N/A"}";
    phone1.text = "${DashboardController.to.profileDetails.phone ?? "N/A"}";
    gender1.text = "${DashboardController.to.profileDetails.sex ?? "N/A"}";
    dob1.text = "${DashboardController.to.profileDetails.birthdate ?? "N/A"}";
    address1.text = "${DashboardController.to.profileDetails.address ?? "N/A"}";
  }

  updateProfile() async {
    updateLoading = true;
    SharedPreferences pref = await SharedPreferences.getInstance();
    var id = pref.getString('patientId');
    var body = {
      "patient_id": "$id",
      "name": name.text,
      "mobile": phone.text,
      "address": address.text,
      "gender": gender.text,
      "dob": dob.text,
      // "photos": FileController.to.pickImage!,
    };
    try {
      var res = await repository.updateProfile(body: body);
      if (statusCode == 200) {
        if (res.status == "200") {
          commonPrint(status: "${res.status}", msg: "${res.message}");
          updateLoading = false;
          if (res.data == null) {
            commonPrint(
                status: "${res.status}",
                msg: "${res.message} get without updated data: ${res.data} ");
          } else {
            commonPrint(
                status: "${res.status}",
                msg: "${res.message} with updated data: ${res.data} ");
            DashboardController.to.getProfile();
            DashboardController.to.getInitialData();
            Get.back();
            MainController.to.pageIndex = 2;
            successSnackBar(msg: "Profile Update Successfully");
          }
        } else {
          commonPrint(status: "404", msg: "Profile update fail");
          updateLoading = false;
        }
      } else if (statusCode == 408) {
        updateLoading = false;
        commonPrint(status: "408", msg: "Timeout Please try again later");
      } else {
        updateLoading = false;
        commonPrint(status: "500", msg: "Server down please try again later");
      }
    } catch (e) {
      updateLoading = false;
      commonPrint(
          status: "422",
          msg: "Error from update profile due to wrong data or format $e");
    }
  }
}
