import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../../widgets/common_popup.dart';
import '../../widgets/common_text.dart';
import '../../widgets/notification_card.dart';
import '../../widgets/report/case_history.dart';
import '../../widgets/report/documents_card.dart';
import '../../widgets/report/lab.dart';
import '../../widgets/report/prescription.dart';

class Documents extends StatelessWidget {
  const Documents({Key? key}) : super(key: key);

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
                    text: "Documents",
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
            Container(
              height: 50,
              margin: const EdgeInsets.only(top: 0, right: 10, left: 10),
              width: media.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.grey.withOpacity(.2),
                      blurRadius: 1,
                      spreadRadius: 1,
                      offset: const Offset(0.1, 0.3))
                ],
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "search",
                    suffixIcon: Icon(Icons.search)),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 15,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return DocumentsCard();
              },
            )
          ],
        ),
      )),
    );
  }
}
