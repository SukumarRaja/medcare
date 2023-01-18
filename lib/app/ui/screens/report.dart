import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/report.dart';
import '../themes/app_colors.dart';
import '../themes/app_font_size.dart';
import '../widgets/common_text.dart';
import '../widgets/report_card.dart';

class Reports extends StatelessWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.black,
                        )),
                    const Spacer(),
                    const CommonText(
                        text: "Report",
                        fontColor: AppColors.black,
                        fontSize: AppFontSize.twenty),
                    const Spacer(),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: media.width * 0.4,
                      margin:
                          const EdgeInsets.only(top: 5, right: 10, left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppColors.black,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.grey.withOpacity(.2),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: const Offset(0.1, 0.3))
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: media.height * 0.02),
                            const CommonText(
                              text: "Blood Group",
                              fontColor: AppColors.white,
                              fontSize: AppFontSize.eighteen,
                            ),
                            SizedBox(height: media.height * 0.01),
                            const Icon(
                              Icons.water_drop,
                              color: AppColors.white,
                              size: 35,
                            ),
                            SizedBox(height: media.height * 0.02),
                            const CommonText(
                              text: "O+",
                              fontColor: AppColors.white,
                              fontSize: AppFontSize.twenty,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: media.width * 0.4,
                      margin:
                          const EdgeInsets.only(top: 5, right: 10, left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppColors.primary.withAlpha(100),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.grey.withOpacity(.2),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: const Offset(0.1, 0.3))
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: media.height * 0.02),
                            const CommonText(
                              text: "Weight",
                              fontColor: AppColors.black,
                              fontSize: AppFontSize.twenty,
                            ),
                            SizedBox(height: media.height * 0.01),
                            Stack(
                              children: [
                                Container(
                                  height: 10,
                                  width: media.width,
                                  // margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                                Obx(() => Container(
                                      height: 10,
                                      width: ReportController.to.wightLevel ==
                                              80
                                          ? media.width * 0.40
                                          : ReportController.to.wightLevel < 80
                                              ? media.width * 0.20
                                              : media.width * 0.55,
                                      // margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: ReportController.to.wightLevel ==
                                                80
                                            ? AppColors.green
                                            : ReportController.to.wightLevel <
                                                    80
                                                ? AppColors.red.withOpacity(.3)
                                                : AppColors.red,
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    )),
                              ],
                            ),
                            SizedBox(height: media.height * 0.01),
                            const CommonText(
                              text: "last measurement",
                              fontColor: AppColors.black,
                              fontSize: AppFontSize.fourteen,
                            ),
                            SizedBox(height: media.height * 0.01),
                            Row(
                              children: const [
                                CommonText(
                                  text: "${80}",
                                  fontColor: AppColors.black,
                                  fontSize: AppFontSize.twenty,
                                  fontWeight: FontWeight.bold,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: CommonText(
                                    text: " kg",
                                    fontColor: AppColors.black,
                                    fontSize: AppFontSize.sixteen,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: media.height * 0.02,
              ),
              Container(
                // height: media.width * 0.4,
                margin: const EdgeInsets.only(top: 5, right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.red.withOpacity(.2),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.grey.withOpacity(.2),
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: const Offset(0.1, 0.3))
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: media.height * 0.02),
                          const CommonText(
                            text: "Heart Rate",
                            fontColor: AppColors.black,
                            fontSize: AppFontSize.twenty,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: media.height * 0.01),
                          const CommonText(
                            text: "last measurement",
                            fontColor: AppColors.black,
                            fontSize: AppFontSize.sixteen,
                          ),
                          SizedBox(height: media.height * 0.01),
                          Row(
                            children: const [
                              CommonText(
                                text: "${97}",
                                fontColor: AppColors.black,
                                fontSize: AppFontSize.twenty,
                                fontWeight: FontWeight.bold,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: CommonText(
                                  text: " bpm",
                                  fontColor: AppColors.black,
                                  fontSize: AppFontSize.sixteen,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: media.height * 0.04),
                        ],
                      ),
                      SizedBox(width: media.width * 0.06),
                      SvgPicture.asset(
                        "assets/svgs/heart.svg",
                        color: AppColors.white,
                        width: media.width,
                        height: media.height * 0.18,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: media.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      ReportController.to.selectReportTypeIndex = 0;
                    },
                    child: Column(
                      children: [
                        const CommonText(text: "All"),
                        SizedBox(height: media.height * 0.003),
                        Obx(() => Container(
                              height: 3,
                              width: 25,
                              decoration: BoxDecoration(
                                  color: ReportController
                                              .to.selectReportTypeIndex ==
                                          0
                                      ? AppColors.primary
                                      : Colors.transparent),
                            ))
                      ],
                    ),
                  ),
                  const Spacer(),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 1.0, right: 2.0),
                        child: GestureDetector(
                          onTap: () {
                            ReportController.to.selectReportTypeIndex = 1;
                          },
                          child: Column(
                            children: [
                              const CommonText(text: "Latest"),
                              SizedBox(height: media.height * 0.003),
                              Obx(() => Container(
                                    height: 3,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        color: ReportController
                                                    .to.selectReportTypeIndex ==
                                                1
                                            ? AppColors.primary
                                            : Colors.transparent),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Obx(() => Container(
                              height: 7,
                              width: 7,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ReportController
                                              .to.selectReportTypeIndex ==
                                          1
                                      ? AppColors.primary
                                      : Colors.transparent),
                            )),
                      )
                    ],
                  ),
                  const Spacer(),
                ],
              ),
              SizedBox(height: media.height * 0.02),
              Obx(() => ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      ReportController.to.selectReportTypeIndex == 1 ? 3 : 5,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, int index) {
                    return const ReportCard();
                  })),
              SizedBox(height: media.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
