import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../themes/app_colors.dart';
import '../themes/app_font_size.dart';
import '../widgets/common_popup.dart';
import '../widgets/common_text.dart';
import '../widgets/notification_card.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
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
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.black,
                      )),
                  const Spacer(),
                  const CommonText(
                    text: "Notifications",
                    fontColor: AppColors.black,
                    fontSize: AppFontSize.twenty,
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        notificationPopupMenu(context);
                      },
                      child: Icon(Icons.menu)),
                ],
              ),
            ),
            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, int index) {
                  return const NotificationCard(
                    title: "Title",
                    message: "Hi this is testing message",
                    ago: "3",
                  );
                }),
          ],
        ),
      )),
    );
  }
}
