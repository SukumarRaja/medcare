import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../common_text.dart';

class LiveDoctorsCard extends StatelessWidget {
  const LiveDoctorsCard(
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
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: media.height * 0.01),
                    CommonText(text: "Dr.$doctorName"),
                    CommonText(
                      text: specialist,
                      fontSize: AppFontSize.twelve,
                      fontColor: AppColors.black.withOpacity(.4),
                    ),
                    SizedBox(
                      height: media.height * 0.01,
                      child: ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, int index) {
                            return const Icon(
                              Icons.star,
                              color: AppColors.primary,
                              size: 14,
                            );
                          }),
                    ),
                    SizedBox(height: media.height * 0.02),
                    CommonText(
                      text: "Experience",
                      fontSize: AppFontSize.twelve,
                      fontColor: AppColors.black.withOpacity(.4),
                    ),
                    CommonText(
                        text:
                            "$experience ${int.parse(experience) > 1 ? "years" : "year"}"),
                    SizedBox(height: media.height * 0.01),
                    CommonText(
                      text: "Patients",
                      fontSize: AppFontSize.twelve,
                      fontColor: AppColors.black.withOpacity(.4),
                    ),
                    CommonText(text: "${patients}k"),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Image.network(
                          image,
                          fit: BoxFit.fitHeight,
                        ),
                        Positioned(
                            right: 5,
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isAvailable == true
                                      ? AppColors.green
                                      : AppColors.red),
                            ))
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
