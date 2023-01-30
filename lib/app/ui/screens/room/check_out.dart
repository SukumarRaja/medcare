import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medcare/app/ui/widgets/common_text.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../../widgets/dotted_divider.dart';
import '../../widgets/room/book_and_review.dart';
import '../../widgets/room/new_booking_card.dart';

class RoomBookingCheckOut extends StatelessWidget {
  const RoomBookingCheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Material(
      child: Container(
        color: AppColors.white,
        child: Stack(
          children: [
            Container(
              height: media.height / 3.7,
              width: media.width,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(50.0)),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.grey.withOpacity(.4),
                      blurRadius: 1,
                      spreadRadius: 1)
                ],
                gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.buttonGradient],
                    begin: Alignment.topRight,
                    end: Alignment.topLeft),
              ),
            ),
            Positioned(
                top: media.height * 0.06,
                left: media.width * 0.04,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: AppColors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.grey.withOpacity(.4),
                                        blurRadius: 1,
                                        spreadRadius: 1)
                                  ]),
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                size: 22,
                                color: AppColors.black.withOpacity(.7),
                              )),
                        ),
                        SizedBox(
                          width: media.width * 0.10,
                        ),
                        CommonText(
                          text: "Checkout",
                          fontColor: AppColors.white,
                          fontSize: AppFontSize.twentyFour,
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                    SizedBox(
                      height: media.height * 0.07,
                    ),
                    Row(
                      children: [
                        //book and review
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.grey.withOpacity(.6),
                                  blurRadius: 1,
                                  spreadRadius: 1)
                            ],
                          ),
                          child: Center(
                              child: CommonText(
                            text: "1",
                            fontSize: AppFontSize.fourteen,
                          )),
                        ),
                        SizedBox(width: media.width * 0.02),
                        CommonText(
                          text: "Book and Review",
                          fontSize: AppFontSize.fourteen,
                          fontColor: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(width: media.width * 0.02),

                        Container(
                            width: 15,
                            child: Divider(
                              color: AppColors.white,
                              thickness: 2,
                            )),
                        SizedBox(width: media.width * 0.02),

                        //payment
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white.withOpacity(.1),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.grey.withOpacity(.6),
                                  blurRadius: 1,
                                  spreadRadius: 1)
                            ],
                          ),
                          child: Center(
                              child: CommonText(
                            text: "2",
                            fontSize: AppFontSize.fourteen,
                            fontColor: AppColors.white,
                          )),
                        ),

                        SizedBox(width: media.width * 0.02),
                        CommonText(
                          text: "Payment",
                          fontSize: AppFontSize.fourteen,
                          fontColor: AppColors.white.withOpacity(.5),
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(width: media.width * 0.02),
                        Container(
                            width: 15,
                            child: Divider(
                              color: AppColors.white,
                              thickness: 2,
                            )),
                        SizedBox(width: media.width * 0.02),

                        //confirm
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white.withOpacity(.1),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.grey.withOpacity(.6),
                                  blurRadius: 1,
                                  spreadRadius: 1)
                            ],
                          ),
                          child: Center(
                              child: CommonText(
                            text: "3",
                            fontSize: AppFontSize.fourteen,
                            fontColor: AppColors.white,
                          )),
                        ),
                        SizedBox(width: media.width * 0.02),
                        CommonText(
                          text: "Confirm",
                          fontSize: AppFontSize.fourteen,
                          fontColor: AppColors.white.withOpacity(.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    )
                  ],
                )),
            Positioned(
              top: 190,
              right: 2,
              left: 2,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    BookAndReviewCard(
                      name: "Executive Suite",
                      size: "32",
                      amount: "250",
                      image:
                          "https://insights.ehotelier.com/wp-content/uploads/sites/6/2020/01/hotel-room.jpg",
                      chooseButton: () {},
                      onPressed: () {},
                    ),
                    Container(
                      width: media.width,
                      margin: const EdgeInsets.only(
                          right: 15.0, left: 15, top: 5, bottom: 10),
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
                                    padding: EdgeInsets.all(5),
                                    margin: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: AppColors.primary.withOpacity(.2),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                AppColors.white.withOpacity(.6),
                                            blurRadius: 1,
                                            spreadRadius: 1)
                                      ],
                                    ),
                                    child: Icon(
                                      Icons.person,
                                      color: AppColors.primary,
                                      size: 25,
                                    )),
                                SizedBox(width: media.width * 0.02),
                                CommonText(
                                  text: "Contact Details",
                                  fontSize: AppFontSize.fifteen,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                            SizedBox(height: media.height * 0.01),
                            Stack(
                              children: [
                                Container(
                                    margin: EdgeInsets.all(8.0),
                                    padding: EdgeInsets.only(
                                        right: 25.0,
                                        left: 10.0,
                                        top: 15.0,
                                        bottom: 15.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: AppColors.primary.withOpacity(.2),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                AppColors.white.withOpacity(.6),
                                            blurRadius: 1,
                                            spreadRadius: 1)
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50.0),
                                      child: CommonText(
                                        text: "Add Contact",
                                        fontColor: AppColors.primary,
                                      ),
                                    )),
                                Positioned(
                                  left: 15,
                                  top: 0,
                                  bottom: 0,
                                  child: Container(
                                      margin: EdgeInsets.only(
                                          top: 12.0, bottom: 12.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppColors.black
                                                  .withOpacity(.1),
                                              blurRadius: 1,
                                              spreadRadius: 1)
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: AppColors.black.withOpacity(.7),
                                        size: 35,
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(height: media.height * 0.01),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: media.width,
                      margin: const EdgeInsets.only(
                          right: 15.0, left: 15, top: 5, bottom: 10),
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
                                    padding: EdgeInsets.all(5),
                                    margin: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: AppColors.sandal.withOpacity(.2),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                AppColors.white.withOpacity(.6),
                                            blurRadius: 1,
                                            spreadRadius: 1)
                                      ],
                                    ),
                                    child: Icon(
                                      Icons.local_offer,
                                      color: AppColors.sandal,
                                      size: 25,
                                    )),
                                SizedBox(width: media.width * 0.02),
                                CommonText(
                                  text: "Promo Code",
                                  fontSize: AppFontSize.fifteen,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                            SizedBox(height: media.height * 0.01),
                            Stack(
                              children: [
                                Container(
                                    margin: EdgeInsets.all(8.0),
                                    padding: EdgeInsets.only(
                                        right: 25.0,
                                        left: 10.0,
                                        top: 15.0,
                                        bottom: 15.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: AppColors.primary.withOpacity(.2),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                AppColors.white.withOpacity(.6),
                                            blurRadius: 1,
                                            spreadRadius: 1)
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50.0),
                                      child: CommonText(
                                        text: "Add Promo Code",
                                        fontColor: AppColors.primary,
                                      ),
                                    )),
                                Positioned(
                                  left: 15,
                                  top: 0,
                                  bottom: 0,
                                  child: Container(
                                      margin: EdgeInsets.only(
                                          top: 12.0, bottom: 12.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppColors.black
                                                  .withOpacity(.1),
                                              blurRadius: 1,
                                              spreadRadius: 1)
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: AppColors.black.withOpacity(.7),
                                        size: 35,
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(height: media.height * 0.01),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 2,
              left: 2,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                    padding: const EdgeInsets.all(15),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.grey.withOpacity(.2),
                            blurRadius: 1,
                            spreadRadius: 1)
                      ],
                      gradient: const LinearGradient(
                          colors: [AppColors.primary, AppColors.buttonGradient],
                          begin: Alignment.topRight,
                          end: Alignment.topLeft),
                    ),
                    child: Center(
                        child: CommonText(
                      text: "Payment",
                      fontColor: AppColors.white,
                      fontSize: AppFontSize.twenty,
                      fontWeight: FontWeight.bold,
                    ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
