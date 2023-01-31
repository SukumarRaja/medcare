import 'package:flutter/material.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_font_size.dart';
import '../../common_text.dart';

class AddContactDetail extends StatelessWidget {
  const AddContactDetail({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      width: media.width,
      margin: const EdgeInsets.only(right: 15.0, left: 15, top: 5, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
              color: AppColors.grey.withOpacity(.4),
              blurRadius: 1,
              spreadRadius: 1)
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppColors.primary.withOpacity(.2),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.white.withOpacity(.6),
                            blurRadius: 1,
                            spreadRadius: 1)
                      ],
                    ),
                    child: const Icon(
                      Icons.person,
                      color: AppColors.primary,
                      size: 25,
                    )),
                SizedBox(width: media.width * 0.02),
                const CommonText(
                  text: "Contact Details",
                  fontSize: AppFontSize.fifteen,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
            SizedBox(height: media.height * 0.01),
            InkWell(
              onTap: onPressed,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: AppColors.primary.withOpacity(.2),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.white.withOpacity(.6),
                          blurRadius: 1,
                          spreadRadius: 1)
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(
                              top: 6.0, bottom: 6.0, left: 6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.black.withOpacity(.1),
                                  blurRadius: 1,
                                  spreadRadius: 1)
                            ],
                          ),
                          child: Icon(
                            Icons.add,
                            color: AppColors.black.withOpacity(.7),
                            size: 35,
                          )),
                      SizedBox(width: media.width * 0.04),
                      const CommonText(
                        text: "Add Contact",
                        fontColor: AppColors.primary,
                      ),
                      SizedBox(width: media.width * 0.04),
                    ],
                  )),
            ),
            SizedBox(height: media.height * 0.01),
          ],
        ),
      ),
    );
  }
}

class ConfirmContactDetail extends StatelessWidget {
  const ConfirmContactDetail({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      width: media.width,
      margin: const EdgeInsets.only(right: 15.0, left: 15, top: 5, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
              color: AppColors.grey.withOpacity(.4),
              blurRadius: 1,
              spreadRadius: 1)
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppColors.primary.withOpacity(.2),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.white.withOpacity(.6),
                            blurRadius: 1,
                            spreadRadius: 1)
                      ],
                    ),
                    child: const Icon(
                      Icons.person,
                      color: AppColors.primary,
                      size: 25,
                    )),
                SizedBox(width: media.width * 0.02),
                const CommonText(
                  text: "Contact Details",
                  fontSize: AppFontSize.fifteen,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
            SizedBox(height: media.height * 0.01),
            Row(
              children: [
                const Icon(
                  Icons.person,
                  color: AppColors.primary,
                  size: 25,
                ),
                SizedBox(width: media.height * 0.01),

                const CommonText(
                  text: "Mr.John",
                  fontSize: AppFontSize.twelve,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),

            Row(
              children: [
                const Icon(
                  Icons.phone,
                  color: AppColors.green,
                  size: 25,
                ),
                SizedBox(width: media.height * 0.01),

                const CommonText(
                  text: "+91 8964265862",
                  fontSize: AppFontSize.twelve,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.email,
                  color: AppColors.sandal,
                  size: 25,
                ),
                SizedBox(width: media.height * 0.01),

                const CommonText(
                  text: "test@gmail.com",
                  fontSize: AppFontSize.twelve,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            SizedBox(height: media.height * 0.01),
          ],
        ),
      ),
    );
  }
}

class AddPromoCode extends StatelessWidget {
  const AddPromoCode({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      width: media.width,
      margin: const EdgeInsets.only(right: 15.0, left: 15, top: 5, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
              color: AppColors.grey.withOpacity(.4),
              blurRadius: 1,
              spreadRadius: 1)
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppColors.sandal.withOpacity(.2),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.white.withOpacity(.6),
                            blurRadius: 1,
                            spreadRadius: 1)
                      ],
                    ),
                    child: const Icon(
                      Icons.local_offer,
                      color: AppColors.sandal,
                      size: 25,
                    )),
                SizedBox(width: media.width * 0.02),
                const CommonText(
                  text: "Promo Code",
                  fontSize: AppFontSize.fifteen,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
            SizedBox(height: media.height * 0.01),
            InkWell(
              onTap: onPressed,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: AppColors.primary.withOpacity(.2),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.white.withOpacity(.6),
                          blurRadius: 1,
                          spreadRadius: 1)
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(
                              top: 6.0, bottom: 6.0, left: 6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.black.withOpacity(.1),
                                  blurRadius: 1,
                                  spreadRadius: 1)
                            ],
                          ),
                          child: Icon(
                            Icons.add,
                            color: AppColors.black.withOpacity(.7),
                            size: 35,
                          )),
                      SizedBox(width: media.width * 0.04),
                      const CommonText(
                        text: "Add Promo Code",
                        fontColor: AppColors.primary,
                      ),
                      SizedBox(width: media.width * 0.04),
                    ],
                  )),
            ),
            SizedBox(height: media.height * 0.01),
          ],
        ),
      ),
    );
  }
}
