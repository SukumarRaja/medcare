import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/family.dart';
import '../../themes/app_colors.dart';
import '../common_text.dart';

class GenderCard extends StatelessWidget {
  const GenderCard(
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
          padding:
              const EdgeInsets.only(top: 5, bottom: 5, right: 25, left: 25),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: AppColors.grey.withOpacity(.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0.1, 0.6),
              )
            ],
            gradient: FamilyController.to.addGenderSelectedIndex == index
                ? const LinearGradient(
                    colors: [AppColors.primary, AppColors.buttonGradient],
                    begin: Alignment.topRight,
                    end: Alignment.topLeft)
                : null,
          ),
          child: CommonText(
            text: text,
            fontColor: FamilyController.to.addGenderSelectedIndex == index
                ? AppColors.white
                : AppColors.black,
          ),
        ),
      ),
    );
  }
}
