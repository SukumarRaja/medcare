import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth.dart';
import '../themes/app_colors.dart';
import '../themes/app_font_size.dart';
import '../widgets/common_loading.dart';
import '../widgets/common_text.dart';
import '../widgets/common_textform_field.dart';
import 'forgot_password.dart';
import 'home/main.dart';
import 'register.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
              SizedBox(
                height: media.height * 0.2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: media.width * 0.05),
                child: const CommonText(
                  text: "Login",
                  fontSize: AppFontSize.twentyFour,
                  fontWeight: FontWeight.w100,
                ),
              ),
              SizedBox(
                height: media.height * 0.02,
              ),
              Form(
                  key: AuthController.to.loginKey,
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
                      CommonTextFormField(
                          hintText: "Enter your password",
                          obscureText: true,
                          controller: AuthController.to.lPassword,
                          validator: (data) {
                            if (data!.isEmpty || data == "") {
                              return "Password field required";
                            } else if (data.length < 2) {
                              return "Password atleast 6 character";
                            }
                            return null;
                          }),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Get.to(() => const ForgotPassword());
                      },
                      child: const CommonText(
                        text: "Forgot Password?",
                        fontColor: AppColors.primary,
                      ))
                ],
              ),
              Obx(() => AuthController.to.loginLoading == true
                  ? const CommonNormalLoading()
                  : GestureDetector(
                      onTap: () {
                        // Get.to(() => HomeMain());
                        if (AuthController.to.loginKey.currentState!
                            .validate()) {
                          AuthController.to.login();
                        }
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
                              text: "Login",
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
                  const CommonText(text: "Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        Get.to(() => const Register());
                      },
                      child: const CommonText(
                        text: "Register",
                        fontColor: AppColors.primary,
                      ))
                ],
              ),
              const Center(child: CommonText(text: "OR")),
              const Center(
                  child: CommonText(
                text: "Continue with",
                fontColor: AppColors.primary,
              )),
              SizedBox(
                height: media.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/google.png")),
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: media.width * 0.05,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/facebook.jpg")),
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: media.width * 0.05)
            ],
          )),
    ));
  }
}
