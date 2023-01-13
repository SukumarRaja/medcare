import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/appointment.dart';
import '../../../controller/doctor.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../../widgets/appointment/appointments_card.dart';
import '../../widgets/common_popup.dart';
import '../../widgets/common_text.dart';
import '../../widgets/doctors/live_doctors_card.dart';
import 'detail.dart';

class Appointments extends StatelessWidget {
  const Appointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
              width: media.width,
              child: GestureDetector(
                  onTap: (){
                    appointmentPopupMenu(context);
                  },
                  child: Icon(Icons.menu)),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: DatePicker(
                DateTime.now(),
                controller: AppointmentController.to.datePickerController,
                initialSelectedDate: DateTime.now(),
                // selectedTextColor: Colors.red,
                onDateChange: (date) {
                  // New date selected
                  // setState(() {
                  //   _selectedValue = date;
                  // });
                },
              ),
            ),
            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, int index) {
                  return AppointmentsCard(
                    doctorName: "Srena Gome",
                    specialist: "Stomach Pain",
                    date: "10/01/2023",
                    time: "01:20 am",
                    status: "Booked",
                    slots: "5",
                    image:
                        "https://www.dragarwal.com/wp-content/uploads/2022/02/eye-doctor-popup.png",
                    onPressed: () {
                      Get.to(() => AppointmentDetail());
                    },
                  );
                }),
          ],
        ),
      )),
    );
  }
}
