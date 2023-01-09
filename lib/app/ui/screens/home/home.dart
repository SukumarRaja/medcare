import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_app/app/ui/themes/app_colors.dart';
import 'package:patient_app/app/ui/themes/app_font_size.dart';
import 'package:patient_app/app/ui/widgets/common_text.dart';

import '../../../controller/slider.dart';
import '../../widgets/banner.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SliderController.to.getImageSliders();
    return Scaffold(
      backgroundColor: AppColors.primary.withOpacity(.04),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Row(
                children: [
                  Column(
                    children: [
                      CommonText(
                        text: "Find your",
                        fontColor: AppColors.black.withOpacity(.5),
                        fontSize: AppFontSize.twenty,
                      ),
                      CommonText(
                        text: "Specialist",
                        fontColor: AppColors.black,
                        fontSize: AppFontSize.twenty,
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.search)
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
                children: [
                  CommonText(text: "Categories"),
                  Spacer(),
                  CommonText(text: "See all")
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.only(
                      top: 5.0, bottom: 5.0, right: 20, left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: AppColors.primary,
                    gradient: const LinearGradient(
                        colors: [AppColors.primary, AppColors.buttonGradient],
                        begin: Alignment.topRight,
                        end: Alignment.topLeft),
                  ),
                  child: Center(
                      child: CommonText(
                    text: "Adults",
                    fontColor: AppColors.white,
                  )),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.only(
                      top: 5.0, bottom: 5.0, right: 20, left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: AppColors.primary,
                    gradient: const LinearGradient(
                        colors: [AppColors.primary, AppColors.buttonGradient],
                        begin: Alignment.topRight,
                        end: Alignment.topLeft),
                  ),
                  child: Center(
                      child: CommonText(
                    text: "Childerns",
                    fontColor: AppColors.white,
                  )),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.only(
                      top: 5.0, bottom: 5.0, right: 20, left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: AppColors.primary,
                    gradient: const LinearGradient(
                        colors: [AppColors.primary, AppColors.buttonGradient],
                        begin: Alignment.topRight,
                        end: Alignment.topLeft),
                  ),
                  child: Center(
                      child: CommonText(
                    text: "Womens",
                    fontColor: AppColors.white,
                  )),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.only(
                      top: 5.0, bottom: 5.0, right: 20, left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: AppColors.primary,
                    gradient: const LinearGradient(
                        colors: [AppColors.primary, AppColors.buttonGradient],
                        begin: Alignment.topRight,
                        end: Alignment.topLeft),
                  ),
                  child: Center(
                      child: CommonText(
                    text: "Mens",
                    fontColor: AppColors.white,
                  )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
