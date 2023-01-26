import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/family.dart';
import '../../themes/app_colors.dart';
import '../common_text.dart';

class BloodCard extends StatelessWidget {
  const BloodCard(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.index})
      : super(key: key);
  final String text;
  final Function() onPressed;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: AppColors.grey.withOpacity(.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0.1, 0.6),
              )
            ],
            gradient: FamilyController.to.addBloodGroupSelectedIndex == index
                ? const LinearGradient(
                    colors: [AppColors.primary, AppColors.buttonGradient],
                    begin: Alignment.topRight,
                    end: Alignment.topLeft)
                : null,
          ),
          child: Center(
            child: CommonText(
              text: text,
              fontColor: FamilyController.to.addBloodGroupSelectedIndex == index
                  ? AppColors.white
                  : AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
