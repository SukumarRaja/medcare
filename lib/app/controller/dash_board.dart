// ignore_for_file: unrelated_type_equality_checks

import 'package:get/get.dart';
import 'package:primedix/app/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/model/doctor.dart';
import '../data/model/profile/profile.dart';
import '../data/repository/dashboard.dart';
import '../data/repository/profile.dart';
import '../ui/widgets/common_print.dart';
import 'auth.dart';
import 'main.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.put(DashboardController());

  final repository = ProfileRepository();
  final dashboardRepository = DashboardRepository();

  final _getProfileLoading = false.obs;

  get getProfileLoading => _getProfileLoading.value;

  set getProfileLoading(value) {
    _getProfileLoading.value = value;
  }

  final _patientName = "".obs;

  get patientName => _patientName.value;

  set patientName(value) {
    _patientName.value = value;
  }

  final _patientEmail = "".obs;

  get patientEmail => _patientEmail.value;

  set patientEmail(value) {
    _patientEmail.value = value;
  }

  var patientPhone = "";

  final _profileDetails = Data().obs;

  get profileDetails => _profileDetails.value;

  set profileDetails(value) {
    _profileDetails.value = value;
  }

  final _getDoctorsLoading = false.obs;

  get getDoctorsLoading => _getDoctorsLoading.value;

  set getDoctorsLoading(value) {
    _getDoctorsLoading.value = value;
  }

  final _doctorDetails = <Datum>[].obs;

  get doctorDetails => _doctorDetails.value;

  set doctorDetails(value) {
    _doctorDetails.value = value;
  }

  final _isDoctorListEmpty = false.obs;

  get isDoctorListEmpty => _isDoctorListEmpty.value;

  set isDoctorListEmpty(value) {
    _isDoctorListEmpty.value = value;
  }

  final _bloodGroup = "".obs;

  get bloodGroup => _bloodGroup.value;

  set bloodGroup(value) {
    _bloodGroup.value = value;
  }

  getInitialData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    patientName = pref.getString('name')!;
    patientEmail = pref.getString('email')!;
    patientPhone = pref.getString('phone')!;
    update();
  }

  getProfile() async {
    getProfileLoading = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var id = preferences.getString('patientId');
    try {
      var res = await repository.getProfile(id: id);
      if (statusCode == 200) {
        if (res.status == "200") {
          getProfileLoading = false;
          if (res.data == null || res.data == "") {
            commonPrint(status: res.status, msg: "No data or id wrong");
          } else {
            profileDetails = res.data;
            bloodGroup =
                res.data!.bloodgroup ?? "N/A";
            commonPrint(
                status: res.status,
                msg: "Profile get successfully with data : ${res.data}");
            Map storedData = {
              "name": "${res.data!.name}",
              "email": "${res.data!.email}",
              "phone": "${res.data!.phone}",
            };
            AuthController.to.storeLocalDevice(body: storedData);
          }
        } else {
          getProfileLoading = false;
          commonPrint(status: "${res.status}", msg: "UnProcessable Data");
        }
      } else {
        commonPrint(
            status: "${res.status}", msg: "Error from server on get profile");
        getProfileLoading = false;
      }
    } catch (e) {
      commonPrint(
          status: "500", msg: "Profile get error due to wrong credentials");
      getProfileLoading = false;
    }
  }

  getDoctors() async {
    getDoctorsLoading = true;
    try {
      var res = await dashboardRepository.getDoctors(
          hospitalId: AppConfig.hospitalId);
      if (statusCode == 200) {
        if (res.status == "200") {
          getDoctorsLoading = false;
          if (res.data == null || res.data == "") {
            commonPrint(status: res.status, msg: "No data or hospitalId wrong");
            isDoctorListEmpty = true;
          } else {
            isDoctorListEmpty = false;
            doctorDetails = res.data;
            commonPrint(
                status: "${res.status}",
                msg: "Name is: ${doctorDetails[0].name}");
            commonPrint(
                status: res.status,
                msg: "Doctors get successfully with data : ${res.data}");
          }
        } else {
          getDoctorsLoading = false;
          isDoctorListEmpty = true;
          commonPrint(status: "${res.status}", msg: "UnProcessable Data");
        }
      } else {
        commonPrint(
            status: "${res.status}", msg: "Error from server on get doctors");
        getDoctorsLoading = false;
        isDoctorListEmpty = true;
      }
    } catch (e) {
      commonPrint(
          status: "500", msg: "Doctors get error due to wrong credentials");
      getDoctorsLoading = false;
      isDoctorListEmpty = true;
    }
  }
}
