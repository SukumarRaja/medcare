import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController {
  static AppointmentController get to => Get.put(AppointmentController());
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
