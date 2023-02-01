import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/gradient_borders.dart';
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.only(
                  right: 15, left: 15, bottom: 15, top: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.grey.withOpacity(.1),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0.3, 0.2))
                  ],
                  border: HomeController.to.selectCategoryIndex == index
                      ? const GradientBoxBorder(
                          gradient: LinearGradient(colors: [
                            AppColors.primary,
                            AppColors.buttonGradient
                          ]),
                          width: 2,
                        )
                      : null

                  // Border.all(
                  //     color: HomeController.to.selectCategoryIndex == index
                  //         ? AppColors.black
                  //         : AppColors.grey.withOpacity(.2),
                  //     width: 2)

                  ),
              child: SvgPicture.asset(
                "assets/svgs/$image.svg",
                height: 30,
                width: 30,
              ),
            ),
            CommonText(
              text: text,
              fontSize: AppFontSize.fourteen,
            )
          ],
        ),
      ),
    );
  }
}
