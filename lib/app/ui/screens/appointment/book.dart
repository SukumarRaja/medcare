import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/appointment.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../../widgets/appointment/afternoon_slots.dart';
import '../../widgets/appointment/morning_slots.dart';
import '../../widgets/common_text.dart';
import '../book_confirmation.dart';

class BookAppointment extends StatelessWidget {
  const BookAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.white,
                            )),
                        const Spacer(),
                        const CommonText(
                          text: "Doctor Detail",
                          fontColor: AppColors.white,
                          fontSize: AppFontSize.twenty,
                          fontWeight: FontWeight.bold,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Container(
                    height: media.width * 0.3,
                    margin: const EdgeInsets.only(top: 5, right: 10, left: 10),
                    width: media.width * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.grey.withOpacity(.2),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: const Offset(0.1, 0.3))
                        ],
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://www.dragarwal.com/wp-content/uploads/2022/02/eye-doctor-popup.png"))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildCount(
                          count: "${150}+",
                          department: "Patients",
                          icon: Icons.favorite),
                      buildCount(
                          count: "${10} years",
                          department: "Experience",
                          icon: Icons.work),
                      buildCount(
                          count: "${4.9}",
                          department: "Ratings",
                          icon: Icons.star),
                    ],
                  ),
                  Container(
                    // height: media.height,
                    width: media.width,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60.0))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: media.height * 0.03),
                        Container(
                          margin: const EdgeInsets.all(8),
                          child: DatePicker(
                            DateTime.now(),
                            controller:
                                AppointmentController.to.datePickerController,
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
                        Row(
                          children: [
                            Spacer(),
                            CommonText(text: "Slots:"),
                            Container(
                              padding: EdgeInsets.all(8),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.0),
                                  color: AppColors.grey.withOpacity(.1),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.white.withOpacity(.3),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: const Offset(0.1, 0.6),
                                    )
                                  ]),
                              child: const Center(
                                child: CommonText(
                                  text: "Available",
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(6),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.0),
                                  color: AppColors.green.withOpacity(.4),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.white.withOpacity(.3),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: const Offset(0.1, 0.6),
                                    )
                                  ]),
                              child: const Center(
                                child: CommonText(
                                  text: "Booked",
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.0),
                                  color: AppColors.red.withOpacity(.2),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.white.withOpacity(.3),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: const Offset(0.1, 0.6),
                                    )
                                  ]),
                              child: const Center(
                                child: CommonText(
                                  text: "Waiting",
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CommonText(
                            text: "Morning Slots",
                            fontSize: AppFontSize.eighteen,
                          ),
                        ),
                        MorningSlots(),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CommonText(
                            text: "Afternoon Slots",
                            fontSize: AppFontSize.eighteen,
                          ),
                        ),
                        AfternoonSlots(),
                        SizedBox(
                          height: media.width * 0.15,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => BookConfirmation());
                    },
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: AppColors.primary,
                          gradient: const LinearGradient(colors: [
                            AppColors.primary,
                            AppColors.buttonGradient
                          ], begin: Alignment.topRight, end: Alignment.topLeft),
                        ),
                        child: const Center(
                          child: CommonText(
                            text: "Continue",
                            fontColor: AppColors.white,
                            fontSize: AppFontSize.twenty,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Column buildCount({required count, required department, required icon}) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white.withOpacity(.2),
          ),
          child: Icon(
            icon,
            color: AppColors.white,
          ),
        ),
        CommonText(
          text: count,
          fontColor: AppColors.white,
        ),
        CommonText(
          text: department,
          fontColor: AppColors.white,
          fontSize: AppFontSize.twelve,
        ),
      ],
    );
  }
}
