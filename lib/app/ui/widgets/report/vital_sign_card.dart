import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/gradient_borders.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../common_text.dart';

class VitalSignsCard extends StatelessWidget {
  const VitalSignsCard(
      {Key? key,
      required this.doctorName,
      required this.specialist,
      required this.experience,
      required this.patients,
      required this.image,
      required this.onPressed,
      required this.isAvailable})
      : super(key: key);
  final String doctorName;
  final String specialist;
  final String experience;
  final String patients;
  final String image;
  final Function() onPressed;
  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: media.width * 0.55,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColors.white,
          border: const GradientBoxBorder(
            gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.buttonGradient]),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
                color: AppColors.grey.withOpacity(.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0.3, 0.2))
          ],
        ),
        child: Row(
          children: [
            //first half
            //icon and title
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "assets/svgs/heart_beat.svg",
                        height: 20,
                        width: 20,
                      ),
                    ),
                    CommonText(text: "Heart Rate"),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "assets/svgs/blood.svg",
                        height: 20,
                        width: 20,
                      ),
                    ),
                    CommonText(text: "Blood Pressure"),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "assets/svgs/temperature.svg",
                        height: 20,
                        width: 20,
                      ),
                    ),
                    CommonText(text: "Temperature"),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "assets/svgs/oxygen.svg",
                        height: 20,
                        width: 20,
                      ),
                    ),
                    CommonText(text: "Oxygen Saturation"),
                  ],
                ),
              ],
            ),
            // colan
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 20, child: CommonText(text: ":")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 20, child: CommonText(text: ":")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 20, child: CommonText(text: ":")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 20, child: CommonText(text: ":")),
                ),
              ],
            ),
            //value
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Container(height: 20, child: CommonText(text: "80")),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child:
                      Container(height: 20, child: CommonText(text: "80/80")),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Container(height: 20, child: CommonText(text: "85")),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Container(height: 20, child: CommonText(text: "85")),
                ),
              ],
            ),
            Spacer(),

            //second half
            //icon and title
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "assets/svgs/respiratory.svg",
                        height: 20,
                        width: 20,
                      ),
                    ),
                    CommonText(text: "Respiratory\nRate"),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "assets/svgs/weight.svg",
                        height: 20,
                        width: 20,
                      ),
                    ),
                    CommonText(text: "BMI Weight"),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "assets/svgs/height.svg",
                        height: 20,
                        width: 20,
                      ),
                    ),
                    CommonText(text: "BMI Height"),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "assets/svgs/date.svg",
                        height: 20,
                        width: 20,
                      ),
                    ),
                    CommonText(text: "Date"),
                  ],
                ),
              ],
            ),
            // colan
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 20, child: CommonText(text: ":")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 20, child: CommonText(text: ":")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 20, child: CommonText(text: ":")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 20, child: CommonText(text: ":")),
                ),
              ],
            ),
            //value
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Container(height: 20, child: CommonText(text: "13")),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Container(height: 20, child: CommonText(text: "30")),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Container(height: 20, child: CommonText(text: "130")),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Container(
                    height: 20,
                    child: CommonText(text: "01/02/2023"),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
