import 'package:get/get.dart';

class DoctorController extends GetxController {
  static DoctorController get to => Get.put(DoctorController());

  final _isDoctorAvailable = false.obs;

  get isDoctorAvailable => _isDoctorAvailable.value;

  set isDoctorAvailable(value) {
    _isDoctorAvailable.value = value;
  }
}
