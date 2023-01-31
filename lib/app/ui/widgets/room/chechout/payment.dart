import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../controller/payment.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_font_size.dart';
import '../../common_text.dart';

class PaymentMethodCardForRoomBooking extends StatelessWidget {
  const PaymentMethodCardForRoomBooking(
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

    return Obx(() => GestureDetector(
          onTap: onPressed,
          child: Container(
              // height: 50,
              width: media.width,
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.only(
                  right: 10.0, left: 10.0, top: 10, bottom: 0),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8.0),
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
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30,
                      width: media.width,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: PaymentController
                                      .to.roomBookingPaymentMethodSelectIndex ==
                                  index
                              ? AppColors.black
                              : AppColors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: PaymentController.to
                                            .roomBookingPaymentMethodSelectIndex ==
                                        index
                                    ? AppColors.grey.withOpacity(.2)
                                    : AppColors.grey,
                                spreadRadius: 1,
                                blurRadius: 2)
                          ]),
                      child: Icon(
                        Icons.check,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}

class PaymentConfirmCard extends StatelessWidget {
  const PaymentConfirmCard(
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

    return  Container(
        // height: 50,
        width: media.width,
        padding: EdgeInsets.all(10.0),
        margin:
            const EdgeInsets.only(right: 10.0, left: 10.0, top: 10, bottom: 0),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8.0),
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
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: onPressed,
                  child: const CommonText(
                    text: "Change",
                    fontColor: AppColors.primary,
                    fontSize: AppFontSize.sixteen,
                  ),
                )),
          ],
        ));
  }
}
