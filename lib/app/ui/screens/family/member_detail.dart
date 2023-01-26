import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/family.dart';
import '../../../controller/report.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../../widgets/common_text.dart';
import '../../widgets/family/blood_card.dart';
import '../../widgets/family/gender_card.dart';
import '../../widgets/report_card.dart';
import '../appointment/book.dart';
import 'update.dart';

class FamilyMemberDetail extends StatelessWidget {
  const FamilyMemberDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: media.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.primary.withOpacity(0.06),
            // gradient: LinearGradient(colors: [
            //   AppColors.primary.withOpacity(.010),
            //   AppColors.white,
            // ], begin: Alignment.center, end: Alignment.bottomCenter),
          ),
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
                                color: AppColors.black,
                              )),
                          SizedBox(width: media.width * 0.04),
                          const CommonText(
                            text: "Detail",
                            fontColor: AppColors.black,
                            fontSize: AppFontSize.twenty,
                            fontWeight: FontWeight.bold,
                          ),
                          const Spacer(),
                          const CommonText(text: "Member ID: MEM000001")
                        ],
                      ),
                    ),
                    Container(
                      height: media.width * 0.3,
                      margin:
                          const EdgeInsets.only(top: 5, right: 10, left: 10),
                      width: media.width * 0.3,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
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
                                  "https://media.istockphoto.com/id/1154642632/photo/close-up-portrait-of-brunette-woman.jpg?s=612x612&w=0&k=20&c=d8W_C2D-2rXlnkyl8EirpHGf-GpM62gBjpDoNryy98U="))),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     buildCount(
                    //         count: "${150}+",
                    //         department: "Patients",
                    //         icon: Icons.favorite),
                    //     buildCount(
                    //         count: "${10} years",
                    //         department: "Experience",
                    //         icon: Icons.work),
                    //     buildCount(
                    //         count: "${4.9}",
                    //         department: "Ratings",
                    //         icon: Icons.star),
                    //   ],
                    // ),
                    Column(
                      children: [
                        SizedBox(height: media.height * 0.01),
                        const CommonText(
                          text: "Dr.Samera Gome",
                          fontSize: AppFontSize.twenty,
                        ),
                        CommonText(
                          text: "+91 8249945698",
                          fontSize: AppFontSize.fourteen,
                          fontColor: AppColors.black.withOpacity(.4),
                        ),
                        CommonText(
                          text: "appdeveloper@gmail.com",
                          fontSize: AppFontSize.fourteen,
                          fontColor: AppColors.black.withOpacity(.7),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10.0),
                                child: CommonText(
                                  text: "Gender",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: media.width * 0.03,
                                    ),
                                    GenderCard(
                                      text: "Male",
                                      index: 0,
                                      onPressed: () {
                                        FamilyController
                                            .to.addGenderSelectedIndex = 0;
                                        FamilyController.to.addSelectedGender =
                                            "Male";
                                      },
                                    ),
                                    SizedBox(
                                      width: media.width * 0.04,
                                    ),
                                    GenderCard(
                                      text: "Female",
                                      index: 1,
                                      onPressed: () {
                                        FamilyController
                                            .to.addGenderSelectedIndex = 1;
                                        FamilyController.to.addSelectedGender =
                                            "Female";
                                      },
                                    ),
                                    SizedBox(
                                      width: media.width * 0.04,
                                    ),
                                    GenderCard(
                                      text: "Others",
                                      index: 2,
                                      onPressed: () {
                                        FamilyController
                                            .to.addGenderSelectedIndex = 2;
                                        FamilyController.to.addSelectedGender =
                                            "Others";
                                      },
                                    )
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                                child: CommonText(
                                  text: "Blood Group",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10.0),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      itemCount: 8,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              childAspectRatio: 4 / 1.8,
                                              crossAxisCount: 5,
                                              crossAxisSpacing: 15,
                                              mainAxisSpacing: 10),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return BloodCard(
                                          text: index == 0
                                              ? "O+"
                                              : index == 1
                                                  ? "O-"
                                                  : index == 2
                                                      ? "A+"
                                                      : index == 3
                                                          ? "A-"
                                                          : index == 4
                                                              ? "B+"
                                                              : index == 5
                                                                  ? "B-"
                                                                  : index == 6
                                                                      ? "AB+"
                                                                      : "AB-",
                                          index: index,
                                          onPressed: () {
                                            if (index == 0) {
                                              FamilyController.to
                                                  .addBloodGroupSelectedIndex = 0;
                                              FamilyController.to
                                                  .addSelectedBloodGroup = "O+";
                                            } else if (index == 1) {
                                              FamilyController.to
                                                  .addBloodGroupSelectedIndex = 1;
                                              FamilyController.to
                                                  .addSelectedBloodGroup = "O-";
                                            } else if (index == 2) {
                                              FamilyController.to
                                                  .addBloodGroupSelectedIndex = 2;
                                              FamilyController.to
                                                  .addSelectedBloodGroup = "A+";
                                            } else if (index == 3) {
                                              FamilyController.to
                                                  .addBloodGroupSelectedIndex = 3;
                                              FamilyController.to
                                                  .addSelectedBloodGroup = "A-";
                                            } else if (index == 4) {
                                              FamilyController.to
                                                  .addBloodGroupSelectedIndex = 4;
                                              FamilyController.to
                                                  .addSelectedBloodGroup = "B+";
                                            } else if (index == 5) {
                                              FamilyController.to
                                                  .addBloodGroupSelectedIndex = 5;
                                              FamilyController.to
                                                  .addSelectedBloodGroup = "B-";
                                            } else if (index == 6) {
                                              FamilyController.to
                                                  .addBloodGroupSelectedIndex = 6;
                                              FamilyController.to
                                                      .addSelectedBloodGroup =
                                                  "AB+";
                                            } else {
                                              FamilyController.to
                                                  .addBloodGroupSelectedIndex = 7;
                                              FamilyController.to
                                                      .addSelectedBloodGroup =
                                                  "AB-";
                                            }
                                            debugPrint(
                                                "Selected blood group index is ${FamilyController.to.addBloodGroupSelectedIndex}");
                                            debugPrint(
                                                "Selected blood group is ${FamilyController.to.addSelectedBloodGroup}");
                                          },
                                        );
                                      },
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const UpdateFamilyMember());
                      },
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width - 40,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: AppColors.primary,
                            gradient: const LinearGradient(
                                colors: [
                                  AppColors.primary,
                                  AppColors.buttonGradient
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.topLeft),
                          ),
                          child: const Center(
                            child: CommonText(
                              text: "Update",
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
