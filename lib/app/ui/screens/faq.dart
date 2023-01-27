import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medcare/app/controller/faq.dart';

import '../themes/app_colors.dart';
import '../themes/app_font_size.dart';
import '../widgets/clipers/bottom_wave.dart';
import '../widgets/common_text.dart';
import '../widgets/faq/question_and_answer_card.dart';

class Faq extends StatelessWidget {
  const Faq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      bottomSheet: buildClipPath(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
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
                  ],
                ),
              ),
              Center(
                  child: SvgPicture.asset(
                "assets/svgs/faq.svg",
                height: media.height / 4,
              )),
              const CommonText(
                text: "FAQ",
                letterSpacing: 0.9,
                fontWeight: FontWeight.bold,
                fontSize: AppFontSize.twentyFour,
              ),
              Container(
                height: 3,
                margin: const EdgeInsets.only(top: 2),
                width: 22,
                color: AppColors.primary,
              ),
              SizedBox(height: media.width * 0.05),

              SizedBox(
                height: media.height,
                child: ListView.builder(
                    itemCount: 30,
                    shrinkWrap: true,
                    // primary: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, int index) {
                      return QuestionAndAnswerCard(
                        index: index,
                        question: "How to logout",
                        answer:
                            "klhkjhkjhkjlhjklhljkhjkhjkhkjhkjhkj QuestionAndAnswerCardQuestionAndAnswerCardQuestionAndAnswerCardQuestionAndAnswerCardQuestionAndAnswerCardQuestionAndAnswerCardQuestionAndAnswerCard",
                        onPressed: () {
                          if (FaqController.to.faqSelectedIndex == index) {
                            FaqController.to.faqSelectedIndex = 150;
                          } else {
                            FaqController.to.faqSelectedIndex = index;
                          }
                        },
                      );
                    }),
              ),
              SizedBox(height: media.height*0.02,)
            ],
          ),
        ),
      ),
    );
  }

  ClipPath buildClipPath() {
    return ClipPath(
        clipper: WaveClipperTwo(reverse: true),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.yellow,
            // gradient: const LinearGradient(
            //     colors: [AppColors.primary, AppColors.buttonGradient],
            //     begin: Alignment.topRight,
            //     end: Alignment.topLeft),
          ),
          child: const Center(
              child: Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: CommonText(
              text: "Primedix",
              fontColor: AppColors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          )),
        ));
  }
}
