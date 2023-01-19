import 'package:get/get.dart';

class ReferalController extends GetxController {
  static ReferalController get to => Get.put(ReferalController());

  final _showToast = false.obs;

  get showToast => _showToast.value;

  set showToast(value) {
    _showToast.value = value;
  }

  final _referalCode = "GHURHT568F".obs;

  get referalCode => _referalCode.value;

  set referalCode(value) {
    _referalCode.value = value;
  }

  showToastMessage() {
    showToast = true;
    Future.delayed(const Duration(seconds: 2), () {
      showToast = false;
    });
  }
}
