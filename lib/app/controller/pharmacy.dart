import 'package:get/get.dart';

class PharmacyController extends GetxController {
  static PharmacyController get to => Get.put(PharmacyController());

  final _initialPrescriptionEmpty = true.obs;

  get initialPrescriptionEmpty => _initialPrescriptionEmpty.value;

  set initialPrescriptionEmpty(value) {
    _initialPrescriptionEmpty.value = value;
  }

  final _isPrescriptionViewed = false.obs;

  get isPrescriptionViewed => _isPrescriptionViewed.value;

  set isPrescriptionViewed(value) {
    _isPrescriptionViewed.value = value;
  }

  final _cartCount = "3".obs;

  get cartCount => _cartCount.value;

  set cartCount(value) {
    _cartCount.value = value;
  }

  final _prescriptionMedicineCount = 0.obs;

  get prescriptionMedicineCount => _prescriptionMedicineCount.value;

  set prescriptionMedicineCount(value) {
    _prescriptionMedicineCount.value = value;
  }

  addMedicineCount() async {
    if (prescriptionMedicineCount == 0) {
      prescriptionMedicineCount++;
      update();
    } else {
      prescriptionMedicineCount++;
    }
  }

  removeMedicineCount() async {
    if (prescriptionMedicineCount != 0) {
      prescriptionMedicineCount--;
      update();
    }
  }
}
