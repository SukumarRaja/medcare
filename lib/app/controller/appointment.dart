// ignore_for_file: unrelated_type_equality_checks

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/appointment/appointment.dart';
import '../data/repository/appointment.dart';
import '../ui/widgets/common_print.dart';
import 'main.dart';

class AppointmentController extends GetxController {
  static AppointmentController get to => Get.put(AppointmentController());

  final repository = AppointmentRepository();
  DatePickerController datePickerController = DatePickerController();

  final _selectedSlots = [].obs;

  get selectedSlots => _selectedSlots.value;

  set selectedSlots(value) {
    _selectedSlots.value = value;
  }

  final _selectedSlotsMap = {}.obs;

  get selectedSlotsMap => _selectedSlotsMap.value;

  set selectedSlotsMap(value) {
    _selectedSlotsMap.value = value;
  }

  final _getAppointmentLoading = false.obs;

  get getAppointmentLoading => _getAppointmentLoading.value;

  set getAppointmentLoading(value) {
    _getAppointmentLoading.value = value;
  }

  final _appointmentDetails = <Datum>[].obs;

  get appointmentDetails => _appointmentDetails.value;

  set appointmentDetails(value) {
    _appointmentDetails.value = value;
  }

  final _isAppointmentListEmpty = false.obs;

  get isAppointmentListEmpty => _isAppointmentListEmpty.value;

  set isAppointmentListEmpty(value) {
    _isAppointmentListEmpty.value = value;
  }

  getAppointments() async {
    getAppointmentLoading = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var id = preferences.getString('patientId');
    try {
      var res = await repository.getAppointments(userId: "$id");
      if (statusCode == 200) {
        if (res.status == "200") {
          getAppointmentLoading = false;
          if (res.data == null || res.data == "") {
            commonPrint(status: res.status, msg: "No data or userId wrong");
            isAppointmentListEmpty = true;
          } else {
            isAppointmentListEmpty = false;
            appointmentDetails = res.data;
            commonPrint(
                status: "${res.status}",
                msg: "Appointment id is: ${appointmentDetails[0].id}");
            commonPrint(
                status: res.status,
                msg: "Appointment get successfully with data : ${res.data}");
          }
        } else {
          getAppointmentLoading = false;
          isAppointmentListEmpty = true;
          commonPrint(status: "${res.status}", msg: "UnProcessable Data");
        }
      } else {
        commonPrint(
            status: "${res.status}",
            msg: "Error from server on get appointments");
        getAppointmentLoading = false;
        isAppointmentListEmpty = true;
      }
    } catch (e) {
      commonPrint(
          status: "500", msg: "Appointment get error due to wrong credentials");
      getAppointmentLoading = false;
      isAppointmentListEmpty = true;
    }
  }

  addSelectedSlots({required id, required value}) async {
    if (selectedSlotsMap.isEmpty) {
      if (selectedSlotsMap['id'] == null || selectedSlotsMap['id'] == "null") {
        selectedSlotsMap.addAll({"id": id, "value": value});
        selectedSlots.add(selectedSlotsMap);
        update();
      } else {
        selectedSlotsMap.remove(selectedSlotsMap['id']);
        update();
      }
      update();
      print("after selected values $selectedSlots");
    } else if (selectedSlotsMap.isNotEmpty) {
      selectedSlotsMap.addAll({"id": id, "value": value});
      update();
      selectedSlots.add(selectedSlotsMap);
      update();

      print("second selected values $selectedSlots");
    }
    update();
  }
}
