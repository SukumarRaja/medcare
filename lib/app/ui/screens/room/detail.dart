import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medcare/app/ui/widgets/common_text.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../../widgets/dotted_divider.dart';
import 'check_out.dart';

class RoomDetail extends StatelessWidget {
  const RoomDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Material(
      child: Container(
        color: AppColors.white,
        child: Stack(
          children: [
            Container(
              height: media.height / 2.3,
              width: media.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://insights.ehotelier.com/wp-content/uploads/sites/6/2020/01/hotel-room.jpg"))),
            ),
            Positioned(
              top: media.height * 0.35,
              child: Container(
                height: media.height,
                width: media.width,
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50))),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: 6,
                          width: 80,
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              color: AppColors.black,
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: media.width * 0.06,
                            // top: 25,
                            right: media.width * 0.06),
                        child: Row(
                          children: [
                            CommonText(
                              text: "Executive Suit",
                              fontWeight: FontWeight.w600,
                              fontSize: AppFontSize.eighteen,
                            ),
                            Spacer(),
                            CommonText(
                              text: "\u{20B9} 350",
                              fontWeight: FontWeight.w600,
                              fontSize: AppFontSize.twentyFour,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: CommonText(
                                text: "/night",
                                fontColor: AppColors.black.withOpacity(.5),
                                fontSize: AppFontSize.twelve,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              left: media.width * 0.06,
                              right: media.width * 0.06),
                          child: DottedDivider(
                            color: AppColors.black.withOpacity(.2),
                          )),
                      Padding(
                        padding:
                            EdgeInsets.only(left: media.width * 0.06, top: 10),
                        child: CommonText(
                          text: "About",
                          fontWeight: FontWeight.w600,
                          fontSize: AppFontSize.eighteen,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: media.width * 0.06,
                            right: media.width * 0.004),
                        child: CommonText(
                          text:
                              "Flights, International Flights, Charter Flights, Hotels, International Hotels, Homestays and Villas, Activities, Holidays In India, International Holidays, Book Hotels From UAE, myBiz for Corporate Travel, Book Online Cabs, Book Bus Tickets, Book Train Tickets, Cheap Tickets to India, Book Flights From US, Book Flights From UAE, Trip Planner, Gift Cards, Trip Money, Trip Ideas, Travel Blog, PNR Status, MakeMyTrip Advertising Solutions, One Way Cab",
                          fontColor: AppColors.black.withOpacity(.5),
                          fontSize: AppFontSize.fourteen,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 15.0, left: 15.0, top: 20),
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
                      Padding(
                        padding:
                            EdgeInsets.only(left: media.width * 0.06, top: 15),
                        child: const CommonText(
                          text: "Previews",
                          fontWeight: FontWeight.w600,
                          fontSize: AppFontSize.eighteen,
                        ),
                      ),
                      Container(
                        height: 120,
                        width: media.width,
                        child: ListView.builder(
                            itemCount: 8,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, int index) {
                              return Container(
                                  width: 120,
                                  margin: EdgeInsets.only(
                                      left: 10.0, top: 10, right: 10.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              "https://insights.ehotelier.com/wp-content/uploads/sites/6/2020/01/hotel-room.jpg"))));
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: media.height * 0.05,
                left: media.width * 0.04,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
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
                )),
            Positioned(
                top: media.height * 0.05,
                right: media.width * 0.04,
                child: GestureDetector(
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
                        Icons.favorite_border_sharp,
                        size: 22,
                        color: AppColors.black.withOpacity(.7),
                      )),
                )),
            Positioned(
                bottom: media.height * 0.02,
                right: media.width * 0.04,
                left: media.width * 0.04,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const RoomBookingCheckOut());
                  },
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.grey.withOpacity(.4),
                              blurRadius: 1,
                              spreadRadius: 1)
                        ],
                        gradient: const LinearGradient(colors: [
                          AppColors.primary,
                          AppColors.buttonGradient
                        ], begin: Alignment.topRight, end: Alignment.topLeft),
                      ),
                      child: Center(
                          child: CommonText(
                        text: "Select",
                        fontColor: AppColors.white,
                        fontSize: AppFontSize.eighteen,
                      ))),
                )),
          ],
        ),
      ),
    );
  }
}
