import 'package:get/get.dart';

class FamilyController extends GetxController {
  static FamilyController get to => Get.put(FamilyController());

  final _addGenderSelectedIndex = 0.obs;

  get addGenderSelectedIndex => _addGenderSelectedIndex.value;

  set addGenderSelectedIndex(value) {
    _addGenderSelectedIndex.value = value;
  }

  final _addSelectedGender = "".obs;

  get addSelectedGender => _addSelectedGender.value;

  set addSelectedGender(value) {
    _addSelectedGender.value = value;
  }

  final _addBloodGroupSelectedIndex = 0.obs;

  get addBloodGroupSelectedIndex => _addBloodGroupSelectedIndex.value;

  set addBloodGroupSelectedIndex(value) {
    _addBloodGroupSelectedIndex.value = value;
  }

  final _addSelectedBloodGroup = "".obs;

  get addSelectedBloodGroup => _addSelectedBloodGroup.value;

  set addSelectedBloodGroup(value) {
    _addSelectedBloodGroup.value = value;
  }
}
