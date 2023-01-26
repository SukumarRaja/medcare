import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../../widgets/common_text.dart';
import '../../widgets/family/family_list_card.dart';
import 'add.dart';
import 'member_detail.dart';
import 'update.dart';

class FamilyMembers extends StatelessWidget {
  const FamilyMembers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(Icons.arrow_back_ios)),
                    const Spacer(),
                    const CommonText(
                      text: "Family Members",
                      fontColor: AppColors.black,
                      fontSize: AppFontSize.twenty,
                    ),
                    const Spacer(),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const AddFamilyMember());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 6,
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.only(
                          top: 5.0, bottom: 5.0, right: 15.0, left: 15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: AppColors.white,
                          gradient: const LinearGradient(colors: [
                            AppColors.primary,
                            AppColors.buttonGradient
                          ], begin: Alignment.topRight, end: Alignment.topLeft),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.grey.withOpacity(.2),
                                spreadRadius: 1,
                                blurRadius: 2)
                          ]),
                      child: const Center(
                          child: CommonText(
                        text: "Add +",
                        fontColor: AppColors.white,
                      )),
                    ),
                  ),
                ],
              ),

              ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, int index) {
                    return FamilyListCard(
                      image:
                          "https://media.istockphoto.com/id/1154642632/photo/close-up-portrait-of-brunette-woman.jpg?s=612x612&w=0&k=20&c=d8W_C2D-2rXlnkyl8EirpHGf-GpM62gBjpDoNryy98U=",
                      name: "Mrs. Shrena",
                      phone: "+91 8961236426",
                      bloodGroup: "O+",
                      lastCheckup: "12/02/2022",
                      updatePressed: () {
                        debugPrint("update Pressed");
                        Get.to(() => const UpdateFamilyMember());
                      },
                      viewPressed: () {
                        debugPrint("view Pressed");
                      },
                      deletePressed: () {
                        debugPrint("delete Pressed");
                      },
                      onPressed: () {
                        Get.to(() => const FamilyMemberDetail());
                      },
                    );
                  })

              // CommonButton(
              //   text: "Checkout",
              //   onPressed: () {},
              // )
            ],
          ),
        ),
      ),
    );
  }
}
