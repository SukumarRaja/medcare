import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/file.dart';
import '../../../controller/profile.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../../widgets/camera_dialouge.dart';
import '../../widgets/common_text.dart';

class ProfileUpdate extends StatelessWidget {
  const ProfileUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return GetBuilder(
        init: ProfileController(),
        initState: (_) {
          ProfileController.to.isShowPassword = false;
          ProfileController.to.data();
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
                            text: "Update",
                            fontColor: AppColors.black,
                            fontSize: AppFontSize.twenty,
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Stack(
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
                    const CommonText(
                      text: "ID: PAT001",
                      fontColor: AppColors.black,
                      fontSize: AppFontSize.sixteen,
                    ),
                    buildContainer(media,
                        icon: Icons.person,
                        controller: ProfileController.to.name),
                    buildContainer(media,
                        icon: Icons.email,
                        controller: ProfileController.to.email),
                    buildContainer(media,
                        icon: Icons.phone,
                        controller: ProfileController.to.phone),
                    buildContainer(media,
                        icon: Icons.female,
                        controller: ProfileController.to.gender),
                    buildContainer(media,
                        icon: Icons.date_range_outlined,
                        controller: ProfileController.to.dob),
                    buildContainer(media,
                        icon: Icons.location_on,
                        controller: ProfileController.to.address),
                    password(media,
                        icon: Icons.lock,
                        text: "**********",
                        isPassword: true,
                        showPassword: "12345678"),
                    updateAt(
                      media,
                      icon: Icons.join_inner,
                      text: "2 months ago",
                    ),
                    updateAt(media,
                        icon: Icons.change_circle, text: "7 minutes ago"),
                    SizedBox(
                      height: media.height * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width - 250,
                          height: 40,
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
                    SizedBox(
                      height: media.height * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Container buildContainer(Size media,
      {required icon,
      TextInputType? keyboardType,
      TextEditingController? controller}) {
    return Container(
        width: media.width,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: AppColors.black.withOpacity(.6),
            boxShadow: [
              BoxShadow(
                  color: AppColors.grey.withOpacity(.2),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0.1, 0.6))
            ]),
        child: SizedBox(
          height: 50,
          child: TextFormField(
            keyboardType: keyboardType,
            cursorColor: AppColors.white,
            style:
                const TextStyle(color: AppColors.white, fontFamily: "Oswald"),
            controller: controller,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  icon,
                  color: AppColors.white,
                ),
                border: const OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ));
  }

  Container password(Size media,
      {required text,
      required icon,
      bool isPassword = false,
      String? showPassword = ""}) {
    return Container(
      width: media.width,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: AppColors.black.withOpacity(.6),
          boxShadow: [
            BoxShadow(
                color: AppColors.grey.withOpacity(.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0.1, 0.6))
          ]),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.white,
          ),
          SizedBox(width: media.width * 0.03),
          Obx(() => CommonText(
                text: ProfileController.to.isShowPassword == true
                    ? showPassword
                    : text,
                fontColor: AppColors.white,
                fontSize: AppFontSize.eighteen,
              )),
          const Spacer(),
          isPassword == true
              ? GestureDetector(
                  onTap: () {
                    ProfileController.to.isShowPassword =
                        !ProfileController.to.isShowPassword;
                  },
                  child: Obx(() => Icon(
                        ProfileController.to.isShowPassword == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.white,
                      )),
                )
              : const SizedBox()
        ],
      ),
    );
  }

  Container updateAt(Size media, {required text, required icon}) {
    return Container(
      width: media.width,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: AppColors.black.withOpacity(.6),
          boxShadow: [
            BoxShadow(
                color: AppColors.grey.withOpacity(.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0.1, 0.6))
          ]),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.white,
          ),
          SizedBox(width: media.width * 0.03),
          CommonText(
            text: text,
            fontColor: AppColors.white,
            fontSize: AppFontSize.eighteen,
          ),
        ],
      ),
    );
  }
}
