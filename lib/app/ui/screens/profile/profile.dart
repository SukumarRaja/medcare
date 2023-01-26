import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utility/utility.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../../widgets/common_alert.dart';
import '../../widgets/common_text.dart';
import '../appointment/history.dart';
import '../bmi.dart';
import '../change_passwrod.dart';
import '../family/members.dart';
import '../pharmacy_on_phone.dart';
import '../refer_friend.dart';
import '../report.dart';
import 'update.dart';
import 'view.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: media.height * 0.04),
                Row(
                  children: [
                    Container(
                      height: media.width * 0.15,
                      margin: const EdgeInsets.only(top: 5, right: 10),
                      width: media.width * 0.15,
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
                                  "https://www.dragarwal.com/wp-content/uploads/2022/02/eye-doctor-popup.png"))),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CommonText(
                          text: "Name",
                          fontSize: AppFontSize.eighteen,
                        ),
                        CommonText(
                          text: "test@gmail.com",
                          fontColor: AppColors.black.withOpacity(.5),
                          fontSize: AppFontSize.fourteen,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: media.width * 0.03),
                CommonText(
                  text: "ACCOUNT",
                  fontColor: AppColors.black.withOpacity(.3),
                  fontSize: AppFontSize.sixteen,
                ),
                SizedBox(height: media.width * 0.03),
                buildTitle(media,
                    prefixIcon: Icons.person,
                    text: "Profile",
                    suffixIcon: Icons.arrow_forward_ios_outlined,
                    onPressed: () {
                  Get.to(() => const ProfileView());
                }),
                SizedBox(height: media.width * 0.03),
                buildTitle(media,
                    prefixIcon: Icons.update,
                    text: "Update",
                    suffixIcon: Icons.arrow_forward_ios_outlined,
                    onPressed: () {
                  Get.to(() => const ProfileUpdate());
                }),
                SizedBox(height: media.width * 0.03),
                buildTitle(media,
                    prefixIcon: Icons.report_gmailerrorred,
                    text: "Reports",
                    suffixIcon: Icons.arrow_forward_ios_outlined,
                    onPressed: () {
                  Get.to(() => const Reports());
                }),
                SizedBox(height: media.width * 0.03),
                CommonText(
                  text: "OTHERS",
                  fontColor: AppColors.black.withOpacity(.3),
                  fontSize: AppFontSize.sixteen,
                ),
                SizedBox(height: media.width * 0.03),
                buildTitle(media,
                    prefixIcon: Icons.monitor_weight_outlined,
                    text: "BMI",
                    suffixIcon: Icons.arrow_forward_ios_outlined,
                    onPressed: () {
                  Get.to(() => const BmiCalculator());
                }),
                SizedBox(height: media.width * 0.03),
                buildTitle(media,
                    prefixIcon: Icons.history,
                    text: "Appointment History",
                    suffixIcon: Icons.arrow_forward_ios_outlined,
                    onPressed: () {
                  Get.to(() => const AppointmentsHistory());
                }),
                SizedBox(height: media.width * 0.03),
                buildTitle(media,
                    prefixIcon: Icons.local_pharmacy_rounded,
                    text: "Pharmacy on phone",
                    suffixIcon: Icons.arrow_forward_ios_outlined,
                    onPressed: () {
                  Get.to(() => const PharmacyOnPhone());
                }),
                SizedBox(height: media.width * 0.03),
                buildTitle(media,
                    prefixIcon: Icons.group,
                    text: "Family Members",
                    suffixIcon: Icons.arrow_forward_ios_outlined,
                    onPressed: () {
                  Get.to(() => const FamilyMembers());
                }),
                SizedBox(height: media.width * 0.03),

                CommonText(
                  text: "SETTINGS",
                  fontColor: AppColors.black.withOpacity(.3),
                  fontSize: AppFontSize.sixteen,
                ),
                SizedBox(height: media.width * 0.02),
                buildTitle(media,
                    prefixIcon: Icons.password,
                    text: "Change Password",
                    suffixIcon: Icons.arrow_forward_ios_outlined,
                    onPressed: () {
                  Get.to(() => const ChangePassword());
                }),
                // SizedBox(height: media.width * 0.02),
                // buildTitle(media,
                //     prefixIcon: Icons.language,
                //     text: "Language",
                //     suffixIcon: Icons.arrow_forward_ios_outlined,
                //     onPressed: () {}),
                // SizedBox(height: media.width * 0.02),
                // buildTitle(media,
                //     prefixIcon: Icons.emergency,
                //     text: "Add Emergency",
                //     suffixIcon: Icons.arrow_forward_ios_outlined,
                //     onPressed: () {}),
                // SizedBox(height: media.width * 0.02),
                // buildTitle(media,
                //     prefixIcon: Icons.monitor_weight_outlined,
                //     text: "BMI",
                //     suffixIcon: Icons.arrow_forward_ios_outlined,
                //     onPressed: () {}),
                // SizedBox(height: media.width * 0.02),
                // buildTitle(media,
                //     prefixIcon: Icons.settings,
                //     text: "Settings",
                //     suffixIcon: Icons.arrow_forward_ios_outlined,
                //     onPressed: () {}),
                SizedBox(height: media.width * 0.03),
                CommonText(
                  text: "ABOUT",
                  fontColor: AppColors.black.withOpacity(.3),
                  fontSize: AppFontSize.sixteen,
                ),
                SizedBox(height: media.width * 0.02),
                buildTitle(media,
                    prefixIcon: Icons.info_outline,
                    text: "About us",
                    suffixIcon: Icons.arrow_forward_ios_outlined,
                    onPressed: () {
                  openBrowser(
                      url: "https://pub.dev/packages/url_launcher/example");
                }),
                SizedBox(height: media.width * 0.02),
                buildTitle(media,
                    prefixIcon: Icons.abc,
                    text: "Terms & Conditions",
                    suffixIcon: Icons.arrow_forward_ios_outlined,
                    onPressed: () {
                  openBrowser(
                      url: "https://pub.dev/packages/url_launcher/example");
                }),
                SizedBox(height: media.width * 0.02),
                buildTitle(media,
                    prefixIcon: Icons.connect_without_contact,
                    text: "Contact us",
                    suffixIcon: Icons.arrow_forward_ios_outlined,
                    onPressed: () {
                  openBrowser(
                      url: "https://pub.dev/packages/url_launcher/example");
                }),
                SizedBox(height: media.width * 0.02),
                buildTitle(media,
                    prefixIcon: Icons.share,
                    text: "Refer Friend",
                    suffixIcon: Icons.arrow_forward_ios_outlined,
                    onPressed: () {
                  Get.to(() => const ReferFriend());
                }),
                SizedBox(height: media.width * 0.08),
                GestureDetector(
                  onTap: () {
                    commonAlertDialog(context,
                        content: "Are you sure logout",
                        confirmButtonPressed: () {});
                  },
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 250,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppColors.primary,
                        gradient: const LinearGradient(colors: [
                          AppColors.primary,
                          AppColors.buttonGradient
                        ], begin: Alignment.topRight, end: Alignment.topLeft),
                      ),
                      child: const Center(
                        child: CommonText(
                          text: "Logout",
                          fontColor: AppColors.white,
                          fontSize: AppFontSize.twenty,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector buildTitle(Size media,
      {required text,
      required prefixIcon,
      required suffixIcon,
      required Function() onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                prefixIcon,
                color: AppColors.black.withOpacity(.8),
                size: 20,
              ),
              SizedBox(width: media.width * 0.03),
              CommonText(
                text: text,
                fontSize: AppFontSize.eighteen,
              ),
              const Spacer(),
              Icon(
                suffixIcon,
                size: 15,
              )
            ],
          ),
        ],
      ),
    );
  }
}
