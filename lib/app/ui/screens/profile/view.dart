import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/profile.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../../widgets/common_text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    ProfileController.to.isShowPassword = false;
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
                      text: "Profile",
                      fontColor: AppColors.black,
                      fontSize: AppFontSize.twenty,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Container(
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
              const CommonText(
                text: "ID: PAT001",
                fontColor: AppColors.black,
                fontSize: AppFontSize.sixteen,
              ),
              buildContainer(media, icon: Icons.person, text: "Test Name"),
              buildContainer(media, icon: Icons.email, text: "test@email.com"),
              buildContainer(media, icon: Icons.phone, text: "+91 8964896932"),
              buildContainer(media, icon: Icons.female, text: "Female"),
              buildContainer(media,
                  icon: Icons.date_range_outlined, text: "12/01/1997"),
              buildContainer(media, icon: Icons.location_on, text: "Namakkal"),
              password(media,
                  icon: Icons.lock,
                  text: "**********",
                  isPassword: true,
                  showPassword: "12345678"),
              buildContainer(media,
                  icon: Icons.join_inner, text: "2 months ago"),
              buildContainer(media,
                  icon: Icons.change_circle, text: "7 minutes ago"),
              SizedBox(
                height: media.height * 0.02,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer(Size media,
      {required text, required icon, bool isPassword = false}) {
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
          const Spacer(),
        ],
      ),
    );
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
}
