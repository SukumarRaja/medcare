import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/config.dart';
import '../../../controller/dash_board.dart';
import '../../../controller/home.dart';
import '../../../controller/slider.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../../widgets/banner.dart';
import '../../widgets/common_loading.dart';
import '../../widgets/common_text.dart';
import '../../widgets/no_doctors.dart';
import '../../widgets/home/doctors_card.dart';
import '../../widgets/home/main_category.dart';
import '../../widgets/home/next_consultation.dart';
import '../doctor/detail.dart';
import '../notifications.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
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
                    Obx(() => DashboardController.to.getProfileLoading == true
                        ? const CommonLoading(
                            size: 60,
                            color: AppColors.primary,
                          )
                        : Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(10.0),
                                shape: BoxShape.circle,
                                color: AppColors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.grey.withOpacity(.2),
                                      spreadRadius: 1,
                                      blurRadius: 2)
                                ],
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(DashboardController
                                                .to.profileDetails.imgUrl ==
                                            null
                                        ? AppConfig.noImage
                                        : "${AppConfig.imageUrl}${DashboardController.to.profileDetails.imgUrl}"))),
                          )),
                    SizedBox(width: media.width * 0.04),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => CommonText(
                              text:
                                  "Hi, ${DashboardController.to.profileDetails.name ?? "..."}",
                              fontColor: AppColors.black,
                              fontSize: AppFontSize.twenty,
                              fontWeight: FontWeight.w500,
                            )),
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
              NextConsultationCard(
                image:
                    "https://www.dragarwal.com/wp-content/uploads/2022/02/eye-doctor-popup.png",
                doctorName: "Samera Gome",
                department: "General",
                date: "10 Oct 2021",
                time: "01:30 - 05:30",
                onPressed: () {},
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
              Obx(() => DashboardController.to.getDoctorsLoading == true
                  ? const CommonLoading()
                  : DashboardController.to.isDoctorListEmpty == true
                      ? const NoDoctors()
                      : SizedBox(
                          height: media.height * 0.2,
                          child: ListView.builder(
                              itemCount:
                                  DashboardController.to.doctorDetails.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, int index) {
                                return DoctorsCard(
                                  doctorName:
                                      "${DashboardController.to.doctorDetails[index].name}",
                                  specialist:
                                      "${DashboardController.to.doctorDetails[index].departmentName}",
                                  image: DashboardController
                                              .to.doctorDetails[index].imgUrl ==
                                          null
                                      ? AppConfig.noImage
                                      : "${DashboardController.to.doctorDetails[index].imgUrl}",
                                  onPressed: () {
                                    Get.to(() => DoctorsDetail());
                                  },
                                );
                              }),
                        )),
            ],
          ),
        ),
      ),
    );
  }
}
