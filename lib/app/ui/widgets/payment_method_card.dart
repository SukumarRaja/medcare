import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/payment.dart';
import '../themes/app_colors.dart';
import '../themes/app_font_size.dart';
import 'common_text.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard(
      {Key? key,
      required this.text,
      required this.image,
      required this.onPressed,
      required this.index})
      : super(key: key);
  final String text;
  final String image;
  final int index;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onPressed,
      child: Obx(() => Container(
          height: 50,
          width: media.width,
          margin:
              const EdgeInsets.only(right: 10.0, left: 10.0, top: 5, bottom: 5),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                  color: PaymentController.to.paymentMethodSelectIndex == index
                      ? AppColors.primary
                      : Colors.transparent),
              boxShadow: [
                BoxShadow(
                    color: AppColors.grey.withOpacity(.2),
                    spreadRadius: 1,
                    blurRadius: 2)
              ]),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: SvgPicture.asset(
                    "assets/svgs/$image.svg",
                    height: 40,
                  )),
              Expanded(
                  flex: 4,
                  child: CommonText(
                    text: text,
                    fontColor: AppColors.black.withOpacity(.6),
                    fontSize: AppFontSize.sixteen,
                  )),
            ],
          ))),
    );
  }
}
