import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/auth.dart';
import '../themes/app_colors.dart';
import '../themes/app_font_size.dart';
import '../widgets/common_text.dart';
import '../widgets/common_textform_field.dart';
import 'otp_verify.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool isVerify = false;
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        maintainBottomViewPadding: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: media.width * 0.01),
                  child: const CommonText(
                    text: "ForgotPassword",
                    fontSize: AppFontSize.twentyFour,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ],
            ),
            SvgPicture.asset("assets/svgs/forgot_password.svg"),
            // SizedBox(
            //   height: media.height * 0.09,
            // ),
            SizedBox(
              height: media.height * 0.02,
            ),
            Form(
                child: Column(
              children: [
                CommonTextFormField(
                    hintText: "Enter your email",
                    controller: AuthController.to.lEmail,
                    validator: (data) {
                      if (data!.isEmpty || data == "") {
                        return "Email field required";
                      }
                      return null;
                    }),
              ],
            )),
            SizedBox(
              height: media.width * 0.06,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const OtpVerify());
              },
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.primary,
                    gradient: const LinearGradient(
                        colors: [AppColors.primary, AppColors.buttonGradient],
                        begin: Alignment.topRight,
                        end: Alignment.topLeft),
                  ),
                  child: const Center(
                    child: CommonText(
                      text: "Sent Otp",
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
    ));
  }
}
