import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth.dart';
import '../themes/app_colors.dart';
import '../themes/app_font_size.dart';
import '../widgets/common_loading.dart';
import '../widgets/common_text.dart';
import '../widgets/common_textform_field.dart';
import '../widgets/intl_phone_field.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        maintainBottomViewPadding: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(
              height: media.height * 0.09,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: media.width * 0.05),
              child: const CommonText(
                text: "Register",
                fontSize: AppFontSize.twentyFour,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(
              height: media.height * 0.02,
            ),
            Form(
                key: AuthController.to.registerKey,
                child: Column(
                  children: [
                    CommonTextFormField(
                        hintText: "Enter your name",
                        controller: AuthController.to.name,
                        validator: (data) {
                          if (data!.isEmpty || data == "") {
                            return "Name field required";
                          }
                          return null;
                        }),
                    CommonTextFormField(
                        hintText: "Enter your email",
                        controller: AuthController.to.email,
                        validator: (data) {
                          if (data!.isEmpty || data == "") {
                            return "Email field required";
                          }
                          return null;
                        }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IntlPhoneField(
                        maxLength: 10,
                        hintText: "Phone",
                        controller: AuthController.to.phone,
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
                    CommonTextFormField(
                        hintText: "Enter your password",
                        obscureText: true,
                        controller: AuthController.to.password,
                        validator: (data) {
                          if (data!.isEmpty || data == "") {
                            return "Password field required";
                          } else if (data.length < 6) {
                            return "Password atleast 6 character";
                          }
                          return null;
                        }),
                  ],
                )),
            SizedBox(
              height: media.width * 0.06,
            ),
            Obx(() => AuthController.to.registerLoading == true
                ? const CommonNormalLoading()
                : GestureDetector(
                    onTap: () {
                      if (AuthController.to.registerKey.currentState!
                          .validate()) {
                        AuthController.to.register();
                      }
                    },
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width - 40,
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
                            text: "Register",
                            fontColor: AppColors.white,
                            fontSize: AppFontSize.twenty,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CommonText(text: "Already have an account?"),
                TextButton(
                    onPressed: () {},
                    child: const CommonText(
                      text: "Login",
                      fontColor: AppColors.primary,
                    ))
              ],
            ),
            const Center(child: CommonText(text: "OR")),
            const Center(
                child: CommonText(
              text: "Continue Guest",
              fontColor: AppColors.primary,
            )),
            SizedBox(
              height: media.height * 0.02,
            ),
          ],
        ),
      ),
    ));
  }
}
