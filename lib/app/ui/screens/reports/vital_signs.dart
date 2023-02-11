import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/doctor.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../../widgets/common_text.dart';
import '../../widgets/doctors/live_doctors_card.dart';
import '../../widgets/report/vital_sign_card.dart';

class VitalSigns extends StatelessWidget {
  const VitalSigns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                        child: const Icon(Icons.arrow_back_ios)),
                    const Spacer(),
                    const CommonText(
                      text: "Vital Signs",
                      fontColor: AppColors.black,
                      fontSize: AppFontSize.twenty,
                    ),
                    Spacer()
                  ],
                ),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(top: 0, right: 10, left: 10),
                width: media.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.grey.withOpacity(.2),
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: const Offset(0.1, 0.3))
                  ],
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "search",
                      suffixIcon: Icon(Icons.search)),
                ),
              ),
              ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, int index) {
                    return VitalSignsCard(
                      doctorName: "Srena Gome",
                      specialist: "Medicine Specialist",
                      experience: "10",
                      patients: "1.20",
                      isAvailable: index == 0
                          ? DoctorController.to.isDoctorAvailable == false
                          : index == 1
                              ? DoctorController.to.isDoctorAvailable == false
                              : false,
                      image:
                          "https://www.dragarwal.com/wp-content/uploads/2022/02/eye-doctor-popup.png",
                      onPressed: () {},
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
