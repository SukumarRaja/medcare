import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../common_text.dart';

class DoctorsCard extends StatelessWidget {
  const DoctorsCard(
      {Key? key,
      required this.doctorName,
      required this.specialist,
      required this.image,
      required this.onPressed})
      : super(key: key);
  final String doctorName;
  final String specialist;
  final String image;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: media.width * 0.35,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColors.white,
          border: const GradientBoxBorder(
            gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.buttonGradient]),
            width: 0,
          ),
          boxShadow: [
            BoxShadow(
                color: AppColors.grey.withOpacity(.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0.3, 0.2))
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 45.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0)),
                  color: AppColors.white,
                  // border: const GradientBoxBorder(
                  //   gradient: LinearGradient(
                  //       colors: [AppColors.primary, AppColors.buttonGradient]),
                  //   width: 0,
                  // ),
                  // boxShadow: [
                  //   BoxShadow(
                  //       color: AppColors.grey.withOpacity(.2),
                  //       spreadRadius: 1,
                  //       blurRadius: 2,
                  //       offset: const Offset(0.3, 0.2))
                  // ],
                ),
                child: Image.network(
                  image,
                  height: media.height,
                  width: media.width,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Positioned(
                bottom: 5,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    CommonText(
                      text: "Dr. $doctorName",
                      fontSize: AppFontSize.sixteen,
                      fontWeight: FontWeight.w500,
                    ),
                    CommonText(
                      text: specialist,
                      fontSize: AppFontSize.twelve,
                      fontColor: AppColors.black.withOpacity(.5),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
