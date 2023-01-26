import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../controller/auth.dart';
import '../../../controller/family.dart';
import '../../../controller/file.dart';
import '../../../controller/payment.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../../widgets/camera_dialouge.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_text.dart';
import '../../widgets/common_textform_field.dart';
import '../../widgets/family/blood_card.dart';
import '../../widgets/family/family_list_card.dart';
import '../../widgets/family/gender_card.dart';
import '../../widgets/intl_phone_field.dart';
import '../../widgets/payment_method_card.dart';

class UpdateFamilyMember extends StatelessWidget {
  const UpdateFamilyMember({Key? key}) : super(key: key);

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
                      text: "Update",
                      fontColor: AppColors.black,
                      fontSize: AppFontSize.twenty,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Center(
                child: Stack(
                  children: [
                    Obx(
                      () => FileController.to.isPicked == true
                          ? Container(
                              width: media.width * 0.3,
                              height: media.width * 0.3,
                              margin: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.grey.withOpacity(.2),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: const Offset(0.1, 0.6),
                                  )
                                ],
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: MemoryImage(
                                        FileController.to.pickImage!)),
                              ),
                            )
                          : Container(
                              width: media.width * 0.3,
                              height: media.width * 0.3,
                              margin: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.grey.withOpacity(.2),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: const Offset(0.1, 0.6),
                                  )
                                ],
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://www.dragarwal.com/wp-content/uploads/2022/02/eye-doctor-popup.png")),
                              ),
                            ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          cameraDialog(context);
                        },
                        child: const Icon(
                          Icons.camera_alt,
                          color: AppColors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: CommonText(
                  text: "Name",
                ),
              ),
              CommonTextFormField(
                  hintText: "Enter name",
                  controller: AuthController.to.lEmail,
                  validator: (data) {
                    if (data!.isEmpty || data == "") {
                      return "Email field required";
                    }
                    return null;
                  }),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: CommonText(
                  text: "Email",
                ),
              ),
              CommonTextFormField(
                  hintText: "Enter email",
                  controller: AuthController.to.lEmail,
                  validator: (data) {
                    if (data!.isEmpty || data == "") {
                      return "Email field required";
                    }
                    return null;
                  }),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: CommonText(
                  text: "Phone",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IntlPhoneField(
                  maxLength: 10,
                  hintText: "Enter phone",
                  controller: AuthController.to.lPassword,
                  initialCountryCode: "IN",
                  fontFamily: "Oswald",
                  validator: (data) {
                    if (data!.isEmpty || data == "") {
                      return "Phone field required";
                    } else if (data.length < 10) {
                      return "Phone number must be 10 character";
                    }
                    return null;
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: CommonText(
                  text: "Password",
                ),
              ),
              CommonTextFormField(
                  hintText: "Enter password",
                  obscureText: true,
                  controller: AuthController.to.lPassword,
                  validator: (data) {
                    if (data!.isEmpty || data == "") {
                      return "Password field required";
                    } else if (data.length < 6) {
                      return "Password atleast 6 character";
                    }
                    return null;
                  }),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
                        FamilyController.to.addGenderSelectedIndex = 0;
                        FamilyController.to.addSelectedGender = "Male";
                      },
                    ),
                    SizedBox(
                      width: media.width * 0.04,
                    ),
                    GenderCard(
                      text: "Female",
                      index: 1,
                      onPressed: () {
                        FamilyController.to.addGenderSelectedIndex = 1;
                        FamilyController.to.addSelectedGender = "Female";
                      },
                    ),
                    SizedBox(
                      width: media.width * 0.04,
                    ),
                    GenderCard(
                      text: "Others",
                      index: 2,
                      onPressed: () {
                        FamilyController.to.addGenderSelectedIndex = 2;
                        FamilyController.to.addSelectedGender = "Others";
                      },
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: CommonText(
                  text: "Blood Group",
                  fontWeight: FontWeight.bold,
                ),
              ),

              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: 8,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 4 / 1.8,
                              crossAxisCount: 5,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 10),
                      itemBuilder: (BuildContext context, int index) {
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
                              FamilyController.to.addBloodGroupSelectedIndex =
                                  0;
                              FamilyController.to.addSelectedBloodGroup = "O+";
                            } else if (index == 1) {
                              FamilyController.to.addBloodGroupSelectedIndex =
                                  1;
                              FamilyController.to.addSelectedBloodGroup = "O-";
                            } else if (index == 2) {
                              FamilyController.to.addBloodGroupSelectedIndex =
                                  2;
                              FamilyController.to.addSelectedBloodGroup = "A+";
                            } else if (index == 3) {
                              FamilyController.to.addBloodGroupSelectedIndex =
                                  3;
                              FamilyController.to.addSelectedBloodGroup = "A-";
                            } else if (index == 4) {
                              FamilyController.to.addBloodGroupSelectedIndex =
                                  4;
                              FamilyController.to.addSelectedBloodGroup = "B+";
                            } else if (index == 5) {
                              FamilyController.to.addBloodGroupSelectedIndex =
                                  5;
                              FamilyController.to.addSelectedBloodGroup = "B-";
                            } else if (index == 6) {
                              FamilyController.to.addBloodGroupSelectedIndex =
                                  6;
                              FamilyController.to.addSelectedBloodGroup = "AB+";
                            } else {
                              FamilyController.to.addBloodGroupSelectedIndex =
                                  7;
                              FamilyController.to.addSelectedBloodGroup = "AB-";
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
