import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/doctor.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../../widgets/appointment/confirmation_slots.dart';
import '../../widgets/common_text.dart';
import '../../widgets/doctors/live_doctors_card.dart';
import 'detail.dart';

class AppointmentDetail extends StatelessWidget {
  const AppointmentDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(Icons.arrow_back_ios)),
                    const Spacer(),
                    const CommonText(
                      text: "Appointment Detail",
                      fontColor: AppColors.black,
                      fontSize: AppFontSize.twenty,
                    ),
                    const Spacer(),
                    CommonText(text: "Appointment ID: MED000001")
                  ],
                ),
              ),
              Container(
                width: media.width * 0.4,
                height: media.width * 0.3,
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey.withOpacity(.2),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0.1, 0.6),
                    )
                  ],
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://www.dragarwal.com/wp-content/uploads/2022/02/eye-doctor-popup.png")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    const CommonText(
                      text: "Booking Details",
                      fontColor: AppColors.green,
                      fontSize: AppFontSize.eighteen,
                    ),
                  ],
                ),
              ),
              Container(
                width: media.width,
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.grey.withOpacity(.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0.1, 0.6))
                    ]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: media.width * 0.04,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: "Booking Date",
                              fontColor: AppColors.black.withOpacity(.5),
                            ),
                            CommonText(
                              text: "Accepted Date",
                              fontColor: AppColors.black.withOpacity(.5),
                            ),
                            CommonText(
                              text: "Appointment Date",
                              fontColor: AppColors.black.withOpacity(.5),
                            ),
                            CommonText(
                              text: "Morning Slots",
                              fontColor: AppColors.black.withOpacity(.5),
                            ),
                            CommonText(
                              text: "Afternoon Slots",
                              fontColor: AppColors.black.withOpacity(.5),
                            ),
                            CommonText(
                              text: "Total Slots",
                              fontColor: AppColors.black.withOpacity(.5),
                            ),
                            CommonText(
                              text: "Total Time",
                              fontColor: AppColors.black.withOpacity(.5),
                            ),
                            CommonText(
                              text: "Status",
                              fontColor: AppColors.black.withOpacity(.5),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            CommonText(text: ":"),
                            CommonText(text: ":"),
                            CommonText(text: ":"),
                            CommonText(text: ":"),
                            CommonText(text: ":"),
                            CommonText(text: ":"),
                            CommonText(text: ":"),
                            CommonText(text: ":"),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: "12/01/2023",
                              fontColor: AppColors.black.withOpacity(.9),
                            ),
                            CommonText(
                              text: "12/01/2023",
                              fontColor: AppColors.black.withOpacity(.9),
                            ),
                            CommonText(
                              text: "12/01/2023",
                              fontColor: AppColors.black.withOpacity(.9),
                            ),
                            CommonText(
                              text: "3",
                              fontColor: AppColors.black.withOpacity(.9),
                            ),
                            CommonText(
                              text: "2",
                              fontColor: AppColors.black.withOpacity(.9),
                            ),
                            CommonText(
                              text: "5",
                              fontColor: AppColors.black.withOpacity(.9),
                            ),
                            CommonText(
                              text: "01:10 hrs",
                              fontColor: AppColors.black.withOpacity(.9),
                            ),
                            CommonText(
                              text: "Accepted",
                              fontColor: AppColors.primary.withOpacity(.8),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: media.width * 0.04,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    const CommonText(
                      text: "Doctor Details",
                      fontColor: AppColors.green,
                      fontSize: AppFontSize.eighteen,
                    ),
                  ],
                ),
              ),
              Container(
                width: media.width,
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.grey.withOpacity(.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0.1, 0.6))
                    ]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: media.width * 0.04,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: "Doctor Name",
                              fontColor: AppColors.black.withOpacity(.5),
                            ),
                            CommonText(
                              text: "Specialization",
                              fontColor: AppColors.black.withOpacity(.5),
                            ),
                            CommonText(
                              text: "Treatment Category",
                              fontColor: AppColors.black.withOpacity(.5),
                            ),
                            CommonText(
                              text: "Doctor Id",
                              fontColor: AppColors.black.withOpacity(.5),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                                text: ":",
                                fontColor: AppColors.black.withOpacity(.5)),
                            const CommonText(text: ":"),
                            const CommonText(text: ":"),
                            const CommonText(text: ":"),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: "DR. Samera Gome",
                              fontColor: AppColors.black.withOpacity(.9),
                            ),
                            CommonText(
                              text: "Medicine Specialist",
                              fontColor: AppColors.black.withOpacity(.9),
                            ),
                            CommonText(
                              text: "Fever",
                              fontColor: AppColors.black.withOpacity(.9),
                            ),
                            CommonText(
                              text: "MEDDOC120",
                              fontColor: AppColors.black.withOpacity(.9),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: media.width * 0.04,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    CommonText(
                      text: "Slot Details",
                      fontColor: AppColors.green,
                      fontSize: AppFontSize.eighteen,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    CommonText(
                      text: "Morning",
                      fontColor: AppColors.green,
                      fontSize: AppFontSize.eighteen,
                    ),
                  ],
                ),
              ),
              ConfirmationSlots(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    CommonText(
                      text: "Afternoon",
                      fontColor: AppColors.green,
                      fontSize: AppFontSize.eighteen,
                    ),
                  ],
                ),
              ),
              ConfirmationSlots(),
              SizedBox(
                height: media.height * 0.02,
              )
            ],
          ),
        ),
      ),
    );
  }
}
