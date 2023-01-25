import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../themes/app_colors.dart';
import '../common_text.dart';

class RoomBookingCard extends StatelessWidget {
  const RoomBookingCard({
    Key? key,
    required this.imageUrl,
    required this.onPressed,
    required this.roomName,
    required this.roomNumber,
    required this.amount,
  }) : super(key: key);

  final DecorationImage imageUrl;
  final Function() onPressed;
  final String roomName;
  final String roomNumber;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: Get.height * 0.3,
        width: Get.width * 0.45,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: const [
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0.6, 0.2),
                  color: AppColors.buttonGradient)
            ],
            image: imageUrl,
            color: AppColors.white),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                // CommonFavoriteButton(
                //   favoriteOnTap: () {
                //     RoomBookingController.to.isFavoriteSelected = !RoomBookingController.to.isFavoriteSelected;
                //   },
                //   isSelected: RoomBookingController.to.isFavoriteSelected,
                // )
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: roomName,
                  fontColor: AppColors.white,
                ),
                CommonText(
                  text: roomNumber,
                  fontColor: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
                CommonText(
                  text: "\u{20B9} $amount / per night",
                  fontColor: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
