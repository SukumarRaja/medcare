import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../themes/app_colors.dart';
import '../themes/app_font_size.dart';
import '../widgets/clipers/bottom_wave.dart';
import '../widgets/common_text.dart';

class ChatBot extends StatelessWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      bottomSheet: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.black.withOpacity(.1),
                        blurRadius: 1,
                        spreadRadius: 2)
                  ]),
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "Enter your message",
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    contentPadding: EdgeInsets.symmetric(horizontal: 15)),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                debugPrint("send pressed");
              },
              child: Container(
                height: 50,
                margin: const EdgeInsets.only(right: 10.0, left: 5),
                decoration: BoxDecoration(
                  color: AppColors.buttonGradient,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.grey.withOpacity(.2),
                        blurRadius: 1,
                        spreadRadius: 2),
                  ],
                  gradient: const LinearGradient(
                      colors: [AppColors.primary, AppColors.buttonGradient],
                      begin: Alignment.topRight,
                      end: Alignment.topLeft),
                ),
                child: const Icon(
                  Icons.send,
                  color: AppColors.white,
                  weight: 15,
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                    clipper: WaveClipperTwo(reverse: false),
                    child: Container(
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppColors.yellow,
                        gradient: const LinearGradient(colors: [
                          AppColors.primary,
                          AppColors.buttonGradient
                        ], begin: Alignment.topRight, end: Alignment.topLeft),
                      ),
                    )),
                Positioned(
                  left: 20,
                  bottom: 45,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(Icons.arrow_back_ios)),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                            // borderRadius: BorderRadius.circular(10.0),
                            shape: BoxShape.circle,
                            color: AppColors.yellow,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://expertphotography.b-cdn.net/wp-content/uploads/2018/10/cool-profile-pictures-retouching-1.jpg"))),
                      ),
                      SizedBox(width: media.width * 0.04),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          CommonText(
                            text: "Chat with",
                            fontColor: AppColors.white,
                            fontSize: AppFontSize.fifteen,
                          ),
                          CommonText(
                            text: "Primedix",
                            fontColor: AppColors.white,
                            fontSize: AppFontSize.twenty,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Positioned(
                    bottom: 20,
                    left: 20,
                    child: CommonText(
                      text: "We are online",
                      fontSize: AppFontSize.fifteen,
                    ))
              ],
            ),
            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: media.width * 0.04),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: AppColors.yellow,
                            gradient: LinearGradient(
                                colors: [
                                  AppColors.grey.withOpacity(0.1),
                                  AppColors.primary.withOpacity(.2)
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.topLeft),
                          ),
                          child: CommonText(
                            text: index == 0
                                ? "Questions for chat bot"
                                : index == 1
                                    ? "Any help"
                                    : "Another help",
                          ),
                        ),
                      ),
                    ],
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: AppColors.yellow,
                    gradient: LinearGradient(colors: [
                      AppColors.grey.withOpacity(.1),
                      AppColors.black.withOpacity(.1)
                    ], begin: Alignment.topRight, end: Alignment.topLeft),
                  ),
                  child: const CommonText(text: "Thank you"),
                ),
                SizedBox(width: media.width * 0.04),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ClipPath buildClipPath() {
    return ClipPath(
        clipper: WaveClipperTwo(reverse: false),
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
