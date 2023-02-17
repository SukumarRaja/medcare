// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primedix/app/utility/utility.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/model/report/vital.dart';
import '../data/repository/report.dart';
import '../ui/widgets/common_print.dart';
import 'main.dart';

class ReportController extends GetxController {
  static ReportController get to => Get.put(ReportController());

  final repository = ReportRepository();

  final _wightLevel = 80.obs;

  get wightLevel => _wightLevel.value;

  set wightLevel(value) {
    _wightLevel.value = value;
  }

  final _heartRate = 10.obs;

  get heartRate => _heartRate.value;

  set heartRate(value) {
    _heartRate.value = value;
  }

  final _selectReportTypeIndex = 0.obs;

  get selectReportTypeIndex => _selectReportTypeIndex.value;

  set selectReportTypeIndex(value) {
    _selectReportTypeIndex.value = value;
  }

  final _getVitalSignLoading = false.obs;

  get getVitalSignLoading => _getVitalSignLoading.value;

  set getVitalSignLoading(value) {
    _getVitalSignLoading.value = value;
  }

  final _vitalListEmpty = false.obs;

  get vitalListEmpty => _vitalListEmpty.value;

  set vitalListEmpty(value) {
    _vitalListEmpty.value = value;
  }

  final _vitalSingDetails = <Datum>[].obs;

  get vitalSingDetails => _vitalSingDetails.value;

  set vitalSingDetails(value) {
    _vitalSingDetails.value = value;
  }

  getVitalSigns() async {
    getVitalSignLoading = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var id = preferences.getString('patientId');
    try {
      var res = await repository.getVitalSigns(userID: id);
      if (statusCode == 200) {
        if (res.status == "200") {
          getVitalSignLoading = false;
          if (res.data == null || res.data == "") {
            commonPrint(status: res.status, msg: "No data or userId wrong");
            vitalListEmpty = true;
          } else {
            vitalListEmpty = false;
            vitalSingDetails = res.data;
            wightLevel = int.parse(res.data![0].bmiWeight);
            debugPrint("weight is $wightLevel");
            heartRate = int.parse(res.data![0].heartRate);
            debugPrint("heart rate is $wightLevel");
            commonPrint(
                status: "${res.status}",
                msg: "VitalSign id is: ${vitalSingDetails[0].id}");
            commonPrint(
                status: res.status,
                msg: "VitalSign get successfully with data : ${res.data}");
          }
        } else {
          getVitalSignLoading = false;
          vitalListEmpty = true;
          commonPrint(status: "${res.status}", msg: "UnProcessable Data");
        }
      } else {
        commonPrint(
            status: "${res.status}", msg: "Error from server on get vitalSign");
        getVitalSignLoading = false;
        vitalListEmpty = true;
      }
    } catch (e) {
      commonPrint(
          status: "500", msg: "VitalSign get error due to wrong credentials");
      getVitalSignLoading = false;
      vitalListEmpty = true;
    }
  }
}
