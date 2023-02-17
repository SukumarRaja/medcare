import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/gradient_borders.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../common_text.dart';

class VitalSignsCard extends StatelessWidget {
  const VitalSignsCard(
      {Key? key,
      required this.heartRate,
      required this.dBloodPressure,
      required this.temperature,
      required this.oxygen,
      required this.respiratory,
      required this.onPressed,
      required this.date,
      required this.weight,
      required this.height,
      required this.sBloodPressure})
      : super(key: key);
  final String heartRate;
  final String dBloodPressure;
  final String sBloodPressure;
  final String temperature;
  final String oxygen;
  final String respiratory;
  final String weight;
  final String height;
  final Function() onPressed;
  final String date;

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
                    const CommonText(text: "Heart Rate"),
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
                    const CommonText(text: "Blood\nPressure"),
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
                    const CommonText(text: "Temperature"),
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
                    const CommonText(text: "Oxygen\nSaturation"),
                  ],
                ),
              ],
            ),
            // colan
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(height: 20, child: CommonText(text: ":")),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(height: 20, child: CommonText(text: ":")),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(height: 20, child: CommonText(text: ":")),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(height: 20, child: CommonText(text: ":")),
                ),
              ],
            ),
            //value
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: SizedBox(
                      height: 20,
                      child: Row(
                        children: [
                          CommonText(text: heartRate),
                          const Padding(
                            padding: EdgeInsets.only(top: 6.0),
                            child: CommonText(
                              text: " bpm",
                              fontSize: AppFontSize.twelve,
                            ),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: SizedBox(
                      height: 20,
                      child: Row(
                        children: [
                          CommonText(text: "$sBloodPressure/$dBloodPressure"),
                          const Padding(
                            padding: EdgeInsets.only(top: 6.0),
                            child: CommonText(
                              text: " mmHg",
                              fontSize: AppFontSize.twelve,
                            ),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: SizedBox(
                      height: 20,
                      child: Row(
                        children: [
                          CommonText(text: temperature),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: CommonText(
                              text: " °C",
                              fontSize: AppFontSize.twelve,
                            ),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: SizedBox(
                      height: 20,
                      child: Row(
                        children: [
                          CommonText(text: oxygen),
                          const Padding(
                            padding: EdgeInsets.only(top: 6.0),
                            child: CommonText(
                              text: " %",
                              fontSize: AppFontSize.twelve,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
            const Spacer(),

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
                    const CommonText(text: "Respiratory\nRate"),
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
                    const CommonText(text: "BMI Weight"),
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
                    const CommonText(text: "BMI Height"),
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
                    const CommonText(text: "Date"),
                  ],
                ),
              ],
            ),
            // colan
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(height: 20, child: CommonText(text: ":")),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(height: 20, child: CommonText(text: ":")),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(height: 20, child: CommonText(text: ":")),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(height: 20, child: CommonText(text: ":")),
                ),
              ],
            ),
            //value
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: SizedBox(
                      height: 20,
                      child: Row(
                        children: [
                          CommonText(text: respiratory),
                          const Padding(
                            padding: EdgeInsets.only(top: 6.0),
                            child: CommonText(
                              text: " bpm",
                              fontSize: AppFontSize.twelve,
                            ),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: SizedBox(
                      height: 20,
                      child: Row(
                        children: [
                          CommonText(text: weight),
                          const Padding(
                            padding: EdgeInsets.only(top: 6.0),
                            child: CommonText(
                              text: " Kg",
                              fontSize: AppFontSize.twelve,
                            ),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: SizedBox(
                      height: 20,
                      child: Row(
                        children: [
                          CommonText(text: height),
                          const Padding(
                            padding: EdgeInsets.only(top: 6.0),
                            child: CommonText(
                              text: " Cm",
                              fontSize: AppFontSize.twelve,
                            ),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: SizedBox(
                    height: 20,
                    child: CommonText(text: date),
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
