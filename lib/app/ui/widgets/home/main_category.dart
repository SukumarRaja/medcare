import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../controller/home.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../common_text.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard(
      {Key? key,
      required this.image,
      required this.text,
      required this.onPressed,
      required this.index})
      : super(key: key);
  final String image;
  final String text;
  final Function() onPressed;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.only(right: 20, left: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                    color: AppColors.grey.withOpacity(.2),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0.3, 0.2))
              ],
              border: Border.all(
                  color: HomeController.to.selectCategoryIndex == index
                      ? AppColors.black
                      : AppColors.grey.withOpacity(.2),
                  width: 2)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/svgs/$image.svg",
                height: 50,
                width: 50,
              ),
              const SizedBox(height: 3),
              CommonText(
                text: text,
                fontSize: AppFontSize.twelve,
              )
            ],
          ),
        ),
      ),
    );
  }
}
