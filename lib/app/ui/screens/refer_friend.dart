import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../../controller/refer.dart';
import '../themes/app_colors.dart';
import '../themes/app_font_size.dart';
import '../widgets/common_text.dart';

class ReferFriend extends StatelessWidget {
  const ReferFriend({Key? key}) : super(key: key);

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
                    text: "Refer",
                    fontSize: AppFontSize.twentyFour,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ],
            ),
            SizedBox(
                height: media.height * 0.3,
                child: SvgPicture.asset("assets/svgs/referal.svg")),
            // SizedBox(
            //   height: media.height * 0.09,
            // ),
            SizedBox(
              height: media.height * 0.02,
            ),
            Center(
              child: CommonText(
                text: "Refer your friend",
                fontColor: AppColors.black.withOpacity(.4),
              ),
            ),
            SizedBox(
              height: media.width * 0.06,
            ),
            Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.grey.withOpacity(.3), width: 1.2),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(
                      text: "${ReferalController.to.referalCode}",
                    ),
                    InkWell(
                        onTap: () {
                          Clipboard.setData(ClipboardData(
                              text: "${ReferalController.to.referalCode}"));
                          ReferalController.to.showToastMessage();
                        },
                        child: const Icon(Icons.copy))
                  ],
                )),

            SizedBox(
              height: media.width * 0.06,
            ),
            GestureDetector(
              onTap: () async {
                await Share.share(
                    "Join me on primedix using my invite code ${ReferalController.to.referalCode} data To make easy your booking");
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
                      text: "Invite",
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
            Obx(() => ReferalController.to.showToast == true
                ? Center(
                    child: Container(
                      width: media.width / 2,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.grey.withOpacity(.6)),
                      child: const CommonText(
                        text: "Code copied",
                        fontSize: AppFontSize.twelve,
                        fontColor: AppColors.black,
                      ),
                    ),
                  )
                : const SizedBox())
          ],
        ),
      ),
    ));
  }
}
