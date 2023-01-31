import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../../widgets/common_text.dart';
import '../appointment/book.dart';

class DoctorsDetail extends StatelessWidget {
  const DoctorsDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.white,
                            )),
                        const Spacer(),
                        const CommonText(
                          text: "Doctor Detail",
                          fontColor: AppColors.white,
                          fontSize: AppFontSize.twenty,
                          fontWeight: FontWeight.bold,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Container(
                    height: media.width * 0.3,
                    margin: const EdgeInsets.only(top: 5, right: 10, left: 10),
                    width: media.width * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.grey.withOpacity(.2),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: const Offset(0.1, 0.3))
                        ],
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://www.dragarwal.com/wp-content/uploads/2022/02/eye-doctor-popup.png"))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildCount(
                          count: "${150}+",
                          department: "Patients",
                          icon: Icons.favorite),
                      buildCount(
                          count: "${10} years",
                          department: "Experience",
                          icon: Icons.work),
                      buildCount(
                          count: "${4.9}",
                          department: "Ratings",
                          icon: Icons.star),
                    ],
                  ),
                  Container(
                    // height: media.height,
                    width: media.width,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60.0))),
                    child: Column(
                      children: [
                        SizedBox(height: media.height * 0.01),
                        const CommonText(
                          text: "Dr.Samera Gome",
                          fontSize: AppFontSize.twenty,
                        ),
                        CommonText(
                          text: "Medicine Specialist",
                          fontSize: AppFontSize.fourteen,
                          fontColor: AppColors.black.withOpacity(.4),
                        ),
                        SizedBox(
                          height: media.height * 0.01,
                          child: ListView.builder(
                              itemCount: 5,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, int index) {
                                return const Icon(
                                  Icons.star,
                                  color: AppColors.primary,
                                  size: 14,
                                );
                              }),
                        ),
                        SizedBox(height: media.height * 0.01),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const CommonText(
                                text: "About Doctor",
                                fontSize: AppFontSize.twenty,
                              ),
                              Container(
                                width: media.width * 0.9,
                                child: CommonText(
                                  text:
                                      "A physician, medical practitioner, medical doctor, or simply doctor, is a health professional who practices medicine, which is concerned with promoting, maintaining or restoring health through the study, diagnosis, prognosis and treatment of disease, injury, and other physical and mental impairments",
                                  fontSize: AppFontSize.sixteen,
                                  fontColor: AppColors.black.withOpacity(.4),
                                ),
                              ),
                              SizedBox(height: media.height * 0.01),
                              Row(
                                children: [
                                  const CommonText(
                                    text: "Recent Comments",
                                    fontSize: AppFontSize.twenty,
                                  ),
                                  const Spacer(),
                                  CommonText(
                                    text: "2 Hour ago",
                                    fontSize: AppFontSize.sixteen,
                                    fontColor: AppColors.black.withOpacity(.3),
                                  ),
                                ],
                              ),
                              SizedBox(height: media.height * 0.01),
                              ListView.builder(
                                  itemCount: 5,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, int index) {
                                    return Row(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          margin: const EdgeInsets.all(5.0),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: AppColors.grey
                                                        .withOpacity(.2),
                                                    blurRadius: 1,
                                                    spreadRadius: 1,
                                                    offset:
                                                        const Offset(0.1, 0.3))
                                              ],
                                              image: const DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "https://www.dragarwal.com/wp-content/uploads/2022/02/eye-doctor-popup.png"))),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CommonText(
                                              text: "Test user",
                                              fontSize: AppFontSize.sixteen,
                                              fontColor: AppColors.black
                                                  .withOpacity(.3),
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: AppColors.primary,
                                                  size: 18,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: AppColors.primary,
                                                  size: 18,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: AppColors.primary,
                                                  size: 18,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: AppColors.primary,
                                                  size: 18,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: AppColors.primary,
                                                  size: 18,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  }),
                              SizedBox(height: media.height * 0.07),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(()=>BookAppointment());
                    },
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width - 40,
                        margin: EdgeInsets.all(10.0),
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: AppColors.primary,
                          gradient: const LinearGradient(colors: [
                            AppColors.primary,
                            AppColors.buttonGradient
                          ], begin: Alignment.topRight, end: Alignment.topLeft),
                        ),
                        child: const Center(
                          child: CommonText(
                            text: "Make Appointment",
                            fontColor: AppColors.white,
                            fontSize: AppFontSize.twenty,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Column buildCount({required count, required department, required icon}) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white.withOpacity(.2),
          ),
          child: Icon(
            icon,
            color: AppColors.white,
          ),
        ),
        CommonText(
          text: count,
          fontColor: AppColors.white,
        ),
        CommonText(
          text: department,
          fontColor: AppColors.white,
          fontSize: AppFontSize.twelve,
        ),
      ],
    );
  }
}
