import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../common_text.dart';

class NextConsultationCard extends StatelessWidget {
  const NextConsultationCard(
      {Key? key,
      required this.image,
      required this.doctorName,
      required this.department,
      required this.date,
      required this.time,
      required this.onPressed})
      : super(key: key);
  final String image;
  final String doctorName;
  final String department;
  final String date;
  final String time;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: AppColors.blue,
          boxShadow: [
            BoxShadow(
                color: AppColors.grey.withOpacity(.3),
                spreadRadius: 1,
                blurRadius: 1)
          ],
          gradient: const LinearGradient(
              colors: [AppColors.primary, AppColors.buttonGradient],
              begin: Alignment.topRight,
              end: Alignment.topLeft),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(10.0),
                      shape: BoxShape.circle,
                      color: AppColors.white,
                      border: Border.all(color: AppColors.yellow, width: 1),
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(image))),
                ),
                SizedBox(width: media.width * 0.04),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: "Dr. $doctorName",
                      fontColor: AppColors.white,
                      fontSize: AppFontSize.twenty,
                      fontWeight: FontWeight.w600,
                    ),
                    CommonText(
                      text: department,
                      // fontColor: AppColors.grey.withOpacity(.7),
                      fontSize: AppFontSize.sixteen,
                      fontColor: AppColors.white.withOpacity(.9),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: AppColors.white.withOpacity(.6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.date_range,
                        color: AppColors.black,
                      ),
                      SizedBox(width: media.width * 0.02),
                      CommonText(
                        text: date,
                        fontColor: AppColors.black,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: AppColors.white.withOpacity(.6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.history_toggle_off,
                        color: AppColors.black,
                      ),
                      SizedBox(width: media.width * 0.02),
                      CommonText(
                        text: time,
                        fontColor: AppColors.black,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
