import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../themes/app_colors.dart';
import '../common_text.dart';

class PrescriptionCard extends StatelessWidget {
  const PrescriptionCard(
      {Key? key,
      required this.prescriptionName,
      required this.pillsOrQty,
      required this.generatedDate,
      required this.previousAmount,
      required this.onPressed})
      : super(key: key);
  final String prescriptionName;
  final String pillsOrQty;
  final String generatedDate;
  final String previousAmount;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                  color: AppColors.grey.withOpacity(.2),
                  spreadRadius: 1,
                  blurRadius: 2)
            ]),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset("assets/svgs/prescription2.svg"),
                )),
            Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                            text: "Name",
                            fontColor: AppColors.black.withOpacity(.6)),
                        CommonText(
                            text: "Pills or Qty",
                            fontColor: AppColors.black.withOpacity(.6)),
                        CommonText(
                            text: "Generated Date",
                            fontColor: AppColors.black.withOpacity(.6)),
                        CommonText(
                            text: "Previous Amount",
                            fontColor: AppColors.black.withOpacity(.6)),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text:
                              ": ${prescriptionName.length > 13 ? "${prescriptionName.substring(0, 12)}...." : prescriptionName}",
                        ),
                        CommonText(
                          text:
                              ": ${pillsOrQty.length > 13 ? "${pillsOrQty.substring(0, 12)}...." : pillsOrQty}",
                          fontColor: AppColors.red.withOpacity(.6),
                        ),
                        CommonText(
                          text:
                              ": ${generatedDate.length > 13 ? "${generatedDate.substring(0, 12)}...." : generatedDate}",
                          fontColor: AppColors.primary.withOpacity(.7),
                        ),
                        CommonText(
                          text:
                              ": \u{20B9} ${previousAmount.length > 13 ? "${previousAmount.substring(0, 12)}...." : previousAmount}",
                          fontColor: AppColors.green,
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
