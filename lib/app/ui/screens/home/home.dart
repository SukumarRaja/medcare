import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home.dart';
import '../../../controller/slider.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../../widgets/banner.dart';
import '../../widgets/common_text.dart';
import '../../widgets/home/doctors_card.dart';
import '../../widgets/home/main_category.dart';
import '../doctor/all_doctors.dart';
import '../doctor/detail.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    SliderController.to.getImageSliders();
    return Scaffold(
      backgroundColor: AppColors.primary.withOpacity(.04),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                child: Row(
                  children: [
                    Column(
                      children: [
                        CommonText(
                          text: "Find your",
                          fontColor: AppColors.black.withOpacity(.5),
                          fontSize: AppFontSize.twenty,
                        ),
                        const CommonText(
                          text: "Specialist",
                          fontColor: AppColors.black,
                          fontSize: AppFontSize.twenty,
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => const AllDoctors());
                        },
                        child: const Icon(Icons.search))
                  ],
                ),
              ),
              SizedBox(height: media.height * 0.01),
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
                    CommonText(text: "Categories"),
                    Spacer(),
                    CommonText(text: "See all")
                  ],
                ),
              ),
              SizedBox(
                height: media.height * 0.045,
                child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, int index) {
                      return Obx(() => GestureDetector(
                            onTap: () {
                              HomeController.to.selectGenderIndex = index;
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.only(
                                  top: 2.0, bottom: 2.0, right: 15, left: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color:
                                    HomeController.to.selectGenderIndex == index
                                        ? AppColors.primary
                                        : AppColors.grey.withOpacity(.3),
                                gradient:
                                    HomeController.to.selectGenderIndex == index
                                        ? const LinearGradient(
                                            colors: [
                                                AppColors.primary,
                                                AppColors.buttonGradient
                                              ],
                                            begin: Alignment.topRight,
                                            end: Alignment.topLeft)
                                        : null,
                              ),
                              child: Center(
                                  child: CommonText(
                                text: "Adults",
                                fontColor:
                                    HomeController.to.selectGenderIndex == index
                                        ? AppColors.white
                                        : AppColors.black.withOpacity(.4),
                              )),
                            ),
                          ));
                    }),
              ),
              SizedBox(height: media.height * 0.01),
              SizedBox(
                height: media.height * 0.15,
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const CommonText(text: "Available Doctor"),
                    const Spacer(),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => const AllDoctors());
                        },
                        child: const CommonText(text: "See all"))
                  ],
                ),
              ),
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
