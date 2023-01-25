import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/room.dart';
import '../../themes/app_colors.dart';
import '../common_text.dart';

class RoomRecommendationContainer extends StatelessWidget {
  const RoomRecommendationContainer(
      {Key? key,
      required this.text,
      required this.index,
      required this.onPressed})
      : super(key: key);
  final String text;
  final int index;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: RoomBookingController.to.recommendationButtonIndex == index
                ? AppColors.primary
                : AppColors.white,
            border: Border.all(color: AppColors.primary),
          ),
          child: Center(
            child: CommonText(
              text: text,
              fontColor:
                  RoomBookingController.to.recommendationButtonIndex == index
                      ? AppColors.white
                      : AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
