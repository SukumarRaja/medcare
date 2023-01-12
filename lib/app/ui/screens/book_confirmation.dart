import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../themes/app_colors.dart';
import '../themes/app_font_size.dart';
import '../widgets/appointment/confirmation_slots.dart';
import '../widgets/common_alert.dart';
import '../widgets/common_text.dart';

class BookConfirmation extends StatelessWidget {
  const BookConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.black,
                      )),
                  const Spacer(),
                  const CommonText(
                    text: "Booking Confirmation",
                    fontColor: AppColors.black,
                    fontSize: AppFontSize.twenty,
                  ),
                  const Spacer(),
                ],
              ),
            ),
            CommonText(
              textAlign: TextAlign.center,
              text:
                  "Book your appointment, before once check all details are correct, once you book appointment then cannot be cancelled the appointment",
              fontColor: AppColors.black.withOpacity(.3),
              fontSize: AppFontSize.fifteen,
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
                          const CommonText(text: "Doctor Name"),
                          const CommonText(text: "Treatment Category"),
                          const CommonText(text: "Date"),
                          const CommonText(text: "Morning Slots"),
                          const CommonText(text: "Afternoon Slots"),
                          const CommonText(text: "Total Slots"),
                          const CommonText(text: "Total Time"),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CommonText(text: ":"),
                          const CommonText(text: ":"),
                          const CommonText(text: ":"),
                          const CommonText(text: ":"),
                          const CommonText(text: ":"),
                          const CommonText(text: ":"),
                          const CommonText(text: ":"),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(text: "DR. Samera Gome"),
                          CommonText(text: "Fever"),
                          CommonText(text: "12/01/2023"),
                          CommonText(text: "3"),
                          CommonText(text: "2"),
                          CommonText(text: "5"),
                          CommonText(text: "01:10 hrs"),
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
                  CommonText(text: "Slots"),
                ],
              ),
            ),
            ConfirmationSlots(),
            Spacer(),
            Center(
              child: GestureDetector(
                onTap: () {
                  successAlert(context, content: "Booking Successfully",
                      confirmButtonPressed: () {
                    Get.back();
                    Get.back();
                    Get.back();
                    Get.back();
                  });
                },
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppColors.primary,
                      gradient: const LinearGradient(
                          colors: [AppColors.primary, AppColors.buttonGradient],
                          begin: Alignment.topRight,
                          end: Alignment.topLeft),
                    ),
                    child: const Center(
                      child: CommonText(
                        text: "Book",
                        fontColor: AppColors.white,
                        fontSize: AppFontSize.twenty,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: media.height * 0.02,
            )
          ],
        ),
      ),
    );
  }
}
