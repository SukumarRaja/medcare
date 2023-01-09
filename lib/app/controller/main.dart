import 'package:get/get.dart';

class MainController extends GetxController {
  static MainController get to => Get.put(MainController());

  final _pageIndex = 2.obs;

  get pageIndex => _pageIndex.value;

  set pageIndex(value) {
    _pageIndex.value = value;
  }
}
