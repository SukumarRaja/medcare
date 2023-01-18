import 'package:get/get.dart';

class ReportController extends GetxController {
  static ReportController get to => Get.put(ReportController());

  final _wightLevel = 80.obs;

  get wightLevel => _wightLevel.value;

  set wightLevel(value) {
    _wightLevel.value = value;
  }

  final _selectReportTypeIndex = 0.obs;

  get selectReportTypeIndex => _selectReportTypeIndex.value;

  set selectReportTypeIndex(value) {
    _selectReportTypeIndex.value = value;
  }
}
