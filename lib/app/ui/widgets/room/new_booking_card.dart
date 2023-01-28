import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../common_text.dart';
import '../dotted_divider.dart';

class RoomBookingCardNew extends StatelessWidget {
  const RoomBookingCardNew(
      {Key? key,
      required this.name,
      required this.size,
      required this.image,
      required this.amount,
      required this.chooseButton,
      required this.onPressed})
      : super(key: key);

  final String name;
  final String size;
  final String image;
  final String amount;
  final Function() chooseButton;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: media.width,
        margin:
            const EdgeInsets.only(right: 15.0, left: 15, top: 5, bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                  color: AppColors.grey.withOpacity(.4),
                  blurRadius: 1,
                  spreadRadius: 1)
            ]),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: media.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: name,
                          fontWeight: FontWeight.w600,
                          fontSize: AppFontSize.twenty,
                        ),
                        CommonText(
                            text: "Room Size : $size m2",
                            fontSize: AppFontSize.sixteen),
                        const CommonText(
                            text: "Non Refundable",
                            fontSize: AppFontSize.fourteen),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(image),
                        ),
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: AppColors.primary.withOpacity(.2),
                            boxShadow: const [
                              BoxShadow(
                                  color: AppColors.white,
                                  blurRadius: 1,
                                  spreadRadius: 1)
                            ]),
                        child: SvgPicture.asset(
                          'assets/svgs/wifi.svg',
                          height: 22,
                          color: AppColors.primary,
                        ),
                      ),
                      const CommonText(
                        text: "Free\nWifi",
                        fontSize: AppFontSize.twelve,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: AppColors.sandal.withOpacity(.2),
                            boxShadow: const [
                              BoxShadow(
                                  color: AppColors.white,
                                  blurRadius: 1,
                                  spreadRadius: 1)
                            ]),
                        child: SvgPicture.asset(
                          'assets/svgs/block.svg',
                          height: 22,
                          color: AppColors.sandal,
                        ),
                      ),
                      const CommonText(
                        textAlign: TextAlign.center,
                        text: "Non-\nRefundable",
                        fontSize: AppFontSize.twelve,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: AppColors.red.withOpacity(.2),
                            boxShadow: const [
                              BoxShadow(
                                  color: AppColors.white,
                                  blurRadius: 1,
                                  spreadRadius: 1)
                            ]),
                        child: SvgPicture.asset(
                          'assets/svgs/air_conditioner.svg',
                          height: 22,
                          color: AppColors.red,
                        ),
                      ),
                      const CommonText(
                        textAlign: TextAlign.center,
                        text: "24 hrs\nAC",
                        fontSize: AppFontSize.twelve,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: AppColors.green.withOpacity(.2),
                            boxShadow: const [
                              BoxShadow(
                                  color: AppColors.white,
                                  blurRadius: 1,
                                  spreadRadius: 1)
                            ]),
                        child: SvgPicture.asset(
                          'assets/svgs/block.svg',
                          height: 22,
                          color: AppColors.green,
                        ),
                      ),
                      const CommonText(
                        textAlign: TextAlign.center,
                        text: "Non-\nSmoking",
                        fontSize: AppFontSize.twelve,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.all(15.0),
                child: DottedDivider(
                  color: AppColors.black.withOpacity(.2),
                )),
            Padding(
              padding: const EdgeInsets.only(
                  right: 15.0, left: 15.0, top: 5, bottom: 15),
              child: Row(
                children: [
                  Column(
                    children: [
                      CommonText(
                        text: "\u{20B9} $amount",
                        fontSize: AppFontSize.fifteen,
                        fontWeight: FontWeight.bold,
                      ),
                      CommonText(
                        text: "/night",
                        fontSize: AppFontSize.twelve,
                        fontColor: AppColors.black.withOpacity(.4),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: chooseButton,
                    child: Container(
                      width: media.width / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: AppColors.primary,
                        gradient: const LinearGradient(colors: [
                          AppColors.primary,
                          AppColors.buttonGradient
                        ], begin: Alignment.topRight, end: Alignment.topLeft),
                      ),
                      child: const Center(
                        child: CommonText(
                          text: "Choose",
                          fontColor: AppColors.white,
                          fontSize: AppFontSize.twenty,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
