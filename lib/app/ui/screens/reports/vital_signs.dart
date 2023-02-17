import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primedix/app/controller/report.dart';
import 'package:primedix/app/ui/widgets/common_loading.dart';
import 'package:primedix/app/ui/widgets/no_doctors.dart';
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
    return GetBuilder(
        init: ReportController(),
        initState: (_) {
          // ReportController.to.getVitalSigns();
        },
        builder: (_) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
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
                      margin:
                          const EdgeInsets.only(top: 0, right: 10, left: 10),
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
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: "search",
                            suffixIcon: Icon(Icons.search)),
                      ),
                    ),
                    Obx(() => ReportController.to.getVitalSignLoading == true
                        ? const CommonLoading(
                            size: 180,
                          )
                        : ReportController.to.vitalListEmpty == true
                            ? const NoData(msg: "No Reports")
                            : ListView.builder(
                                itemCount:
                                    ReportController.to.vitalSingDetails.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, int index) {
                                  return VitalSignsCard(
                                    heartRate:
                                        "${ReportController.to.vitalSingDetails[index].heartRate}",
                                    dBloodPressure:
                                        "${ReportController.to.vitalSingDetails[index].diastolicBloodPressure}",
                                    sBloodPressure:
                                        "${ReportController.to.vitalSingDetails[index].systolicBloodPressure}",
                                    temperature:
                                        "${ReportController.to.vitalSingDetails[index].temperature}",
                                    oxygen:
                                        "${ReportController.to.vitalSingDetails[index].oxygenSaturation}",
                                    respiratory:
                                        "${ReportController.to.vitalSingDetails[index].respiratoryRate}",
                                    height:
                                        "${ReportController.to.vitalSingDetails[index].bmiHeight}",
                                    weight:
                                        "${ReportController.to.vitalSingDetails[index].bmiWeight}",
                                    date:
                                        "${ReportController.to.vitalSingDetails[index].addDateTime}"
                                            .substring(0, 10),
                                    onPressed: () {},
                                  );
                                })),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
