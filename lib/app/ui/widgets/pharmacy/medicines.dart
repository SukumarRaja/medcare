import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../common_text.dart';

class MedicinesCard extends StatelessWidget {
  const MedicinesCard(
      {Key? key,
      required this.medicineImage,
      required this.medicineName,
      required this.amount,
      required this.count,
      required this.deletePressed,
      required this.removePressed,
      required this.addPressed})
      : super(key: key);
  final String medicineImage;
  final String medicineName;
  final String amount;
  final String count;
  final Function() deletePressed;
  final Function() removePressed;
  final Function() addPressed;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      width: media.width,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color: AppColors.grey.withOpacity(.2),
                spreadRadius: 1,
                blurRadius: 2)
          ]),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    height: 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(medicineImage))),
                  )),
              Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CommonText(
                        text: medicineName,
                        fontSize: AppFontSize.sixteen,
                      ),
                      CommonText(
                        text: "\u{20B9} $amount",
                        fontSize: AppFontSize.fourteen,
                        fontColor: AppColors.green,
                      ),
                    ],
                  )),
            ],
          ),
          Positioned(
            bottom: 5,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // remove button
                GestureDetector(
                  onTap: removePressed,
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.grey.withOpacity(.2),
                              spreadRadius: 1,
                              blurRadius: 2)
                        ]),
                    child: const Center(
                        child: Icon(
                      Icons.remove,
                      weight: 10,
                      shadows: [Shadow(color: AppColors.grey, blurRadius: 1)],
                      color: AppColors.primary,
                      size: 20,
                    )),
                  ),
                ),
                SizedBox(width: media.width * 0.02),

                // add count
                CommonText(
                  text: count,
                  fontSize: AppFontSize.fourteen,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(width: media.width * 0.02),

                // add button
                GestureDetector(
                  onTap: addPressed,
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.grey.withOpacity(.2),
                              spreadRadius: 1,
                              blurRadius: 2)
                        ]),
                    child: const Center(
                        child: Icon(
                      Icons.add,
                      weight: 10,
                      shadows: [Shadow(color: AppColors.grey, blurRadius: 1)],
                      color: AppColors.primary,
                      size: 20,
                    )),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 5,
            child: GestureDetector(
                onTap: deletePressed,
                child: const Icon(
                  Icons.delete,
                  color: AppColors.grey,
                )),
          ),
        ],
      ),
    );
  }
}
