import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home.dart';
import '../../../controller/slider.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../../widgets/banner.dart';
import '../../widgets/clipers/bottom_wave.dart';
import '../../widgets/common_text.dart';
import '../../widgets/home/doctors_card.dart';
import '../../widgets/home/main_category.dart';
import '../doctor/all_doctors.dart';
import '../doctor/detail.dart';
import '../notifications.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    SliderController.to.getImageSliders();
    return Scaffold(
      // backgroundColor: AppColors.primary.withOpacity(.04),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: media.width * 0.04,
                    vertical: media.height * 0.02),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                          // borderRadius: BorderRadius.circular(10.0),
                          shape: BoxShape.circle,
                          color: AppColors.yellow,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://expertphotography.b-cdn.net/wp-content/uploads/2018/10/cool-profile-pictures-retouching-1.jpg"))),
                    ),
                    SizedBox(width: media.width * 0.04),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: "Hi, Test User",
                          fontColor: AppColors.black,
                          fontSize: AppFontSize.twenty,
                          fontWeight: FontWeight.w500,
                        ),
                        CommonText(
                          text: "How are you feel today",
                          fontColor: AppColors.grey.withOpacity(.7),
                          fontSize: AppFontSize.fifteen,
                        ),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => const Notifications());
                        },
                        child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: AppColors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.grey.withOpacity(.3),
                                      spreadRadius: 1,
                                      blurRadius: 1)
                                ]),
                            child: const Icon(Icons.notifications_none)))
                  ],
                ),
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0),
              //   child: Row(
              //     children: [
              //       Column(
              //         children: [
              //           CommonText(
              //             text: "Find your",
              //             fontColor: AppColors.black.withOpacity(.5),
              //             fontSize: AppFontSize.twenty,
              //           ),
              //           const CommonText(
              //             text: "Specialist",
              //             fontColor: AppColors.black,
              //             fontSize: AppFontSize.twenty,
              //           ),
              //         ],
              //       ),
              //       const Spacer(),
              //       GestureDetector(
              //           onTap: () {
              //             Get.to(() => const AllDoctors());
              //           },
              //           child: const CommonText(text: "See All")),
              //       // SizedBox(width: media.width * 0.02),
              //       // GestureDetector(
              //       //     onTap: () {
              //       //       Get.to(() => const Notifications());
              //       //     },
              //       //     child: const Icon(Icons.notifications))
              //     ],
              //   ),
              // ),
              // SizedBox(height: media.height * 0.01),
              Obx(
                () => SliderController.to.loadingSliders == true
                    ? const Text("Loading")
                    : Obx(() => CommonSlider(
                          // imageSliders: SliderController.to.imageSlider,
                          dbImage: SliderController.to.dbImage,
                          imageSliders: const [
                            "https://media.istockphoto.com/id/638377134/photo/doctor-man-with-stethoscope-in-hospital.jpg?s=612x612&w=0&k=20&c=xldnHCxhAhi4VYWsrucaABm_jyUcn9vN1Azh2XcLQ_0=",
                            "https://img.freepik.com/free-photo/covid19-preventing-virus-health-healthcare-workers-quarantine-concept-determined-female-nurse-doctor-blue-scrubs-medical-mask-gloves-pointing-fingers-down-showing-info-banner_1258-92938.jpg?w=2000",
                            "https://www.shutterstock.com/image-photo/doctors-group-260nw-569420371.jpg",
                          ],
                        )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: const [
                    CommonText(
                      text: "Next Consultation",
                      fontWeight: FontWeight.w600,
                    ),
                    Spacer(),
                    CommonText(
                      text: "View all",
                      fontColor: AppColors.primary,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppColors.blue,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.grey.withOpacity(.3),
                        spreadRadius: 1,
                        blurRadius: 1)
                  ],
                  gradient: const LinearGradient(
                      colors: [AppColors.primary, AppColors.buttonGradient],
                      begin: Alignment.topRight,
                      end: Alignment.topLeft),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(10.0),
                              shape: BoxShape.circle,
                              color: AppColors.white,
                              border:
                                  Border.all(color: AppColors.yellow, width: 1),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://www.dragarwal.com/wp-content/uploads/2022/02/eye-doctor-popup.png"))),
                        ),
                        SizedBox(width: media.width * 0.04),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: "Dr. Samera Gome",
                              fontColor: AppColors.white,
                              fontSize: AppFontSize.twenty,
                              fontWeight: FontWeight.w600,
                            ),
                            CommonText(
                              text: "Microbiologist",
                              // fontColor: AppColors.grey.withOpacity(.7),
                              fontSize: AppFontSize.sixteen,
                              fontColor: AppColors.white.withOpacity(.9),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: AppColors.white.withOpacity(.6),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.date_range,
                                color: AppColors.black,
                              ),
                              SizedBox(width: media.width * 0.02),
                              CommonText(
                                text: "10 Oct 2021",
                                fontColor: AppColors.black,
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: AppColors.white.withOpacity(.6),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.history_toggle_off,
                                color: AppColors.black,
                              ),
                              SizedBox(width: media.width * 0.02),
                              CommonText(
                                text: "01:30 - 05:30",
                                fontColor: AppColors.black,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: const [
                    CommonText(
                        text: "Find Your Doctor", fontWeight: FontWeight.w600),
                    Spacer(),
                    CommonText(
                      text: "See More",
                      fontColor: AppColors.primary,
                    )
                  ],
                ),
              ),
              // SizedBox(
              //   height: media.height * 0.045,
              //   child: ListView.builder(
              //       itemCount: 5,
              //       shrinkWrap: true,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, int index) {
              //         return Obx(() => GestureDetector(
              //               onTap: () {
              //                 HomeController.to.selectGenderIndex = index;
              //               },
              //               child: Container(
              //                 margin: const EdgeInsets.all(5),
              //                 padding: const EdgeInsets.only(
              //                     top: 2.0, bottom: 2.0, right: 15, left: 15),
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(30.0),
              //                   color:
              //                       HomeController.to.selectGenderIndex == index
              //                           ? AppColors.primary
              //                           : AppColors.grey.withOpacity(.3),
              //                   gradient:
              //                       HomeController.to.selectGenderIndex == index
              //                           ? const LinearGradient(
              //                               colors: [
              //                                   AppColors.primary,
              //                                   AppColors.buttonGradient
              //                                 ],
              //                               begin: Alignment.topRight,
              //                               end: Alignment.topLeft)
              //                           : null,
              //                 ),
              //                 child: Center(
              //                     child: CommonText(
              //                   text: "Adults",
              //                   fontColor:
              //                       HomeController.to.selectGenderIndex == index
              //                           ? AppColors.white
              //                           : AppColors.black.withOpacity(.4),
              //                 )),
              //               ),
              //             ));
              //       }),
              // ),
              SizedBox(
                height: media.height * 0.13,
                child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, int index) {
                      return CategoriesCard(
                        text: "Pediatrician",
                        image: "pediatrician",
                        index: index,
                        onPressed: () {
                          HomeController.to.selectCategoryIndex = index;
                        },
                      );
                    }),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Row(
              //     children: [
              //       const CommonText(text: "Available Doctor"),
              //       const Spacer(),
              //       GestureDetector(
              //           onTap: () {
              //             Get.to(() => const AllDoctors());
              //           },
              //           child: const CommonText(text: "See all"))
              //     ],
              //   ),
              // ),
              SizedBox(
                height: media.height * 0.2,
                child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, int index) {
                      return DoctorsCard(
                        doctorName: "Srena Gome",
                        specialist: "Medicine Specialist",
                        experience: "10",
                        patients: "1.20",
                        image:
                            "https://www.dragarwal.com/wp-content/uploads/2022/02/eye-doctor-popup.png",
                        onPressed: () {
                          Get.to(() => DoctorsDetail());
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
