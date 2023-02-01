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
import '../doctor/detail.dart';
import 'detail.dart';

class BookNewAppointments extends StatelessWidget {
  const BookNewAppointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.only(
                        right: 15.0, left: 15, top: 15, bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.grey.withOpacity(.4),
                            spreadRadius: 1,
                            blurRadius: 2,
                            // offset: Offset(0.2, 0.6)
                          )
                        ]),
                    child: TextFormField(
                      style: TextStyle(
                          fontFamily: "Oswald",
                          color: AppColors.black.withOpacity(.8)),
                      cursorColor: AppColors.primary,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        prefixIcon: Icon(Icons.search),
                        hintText: "search doctors",
                        hintStyle: TextStyle(fontFamily: "Oswald"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                      onTap: () {
                        commonPopupMenu(context);
                      },
                      child: Container(
                          margin: const EdgeInsets.only(right: 15.0),
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.grey.withOpacity(.4),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  // offset: Offset(0.2, 0.6)
                                )
                              ]),
                          child: const Icon(Icons.menu))),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: DatePicker(
                DateTime.now(),
                selectionColor: AppColors.primary,
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
                  return LiveDoctorsCard(
                    doctorName: "Srena Gome",
                    specialist: "Medicine Specialist",
                    experience: "10",
                    patients: "1.20",
                    isAvailable: index == 0
                        ? DoctorController.to.isDoctorAvailable == false
                        : index == 1
                            ? DoctorController.to.isDoctorAvailable == false
                            : false,
                    image:
                        "https://www.dragarwal.com/wp-content/uploads/2022/02/eye-doctor-popup.png",
                    onPressed: () {
                      Get.to(() => DoctorsDetail());
                    },
                  );
                }),
          ],
        ),
      )),
    );
  }
}
