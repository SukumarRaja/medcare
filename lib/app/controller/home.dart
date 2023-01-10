import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.put(HomeController());

  final _selectCategoryIndex = 12.obs;

  get selectCategoryIndex => _selectCategoryIndex.value;

  set selectCategoryIndex(value) {
    _selectCategoryIndex.value = value;
  }

  final _selectGenderIndex = 6.obs;

  get selectGenderIndex => _selectGenderIndex.value;

  set selectGenderIndex(value) {
    _selectGenderIndex.value = value;
  }
}
