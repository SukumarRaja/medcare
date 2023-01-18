import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/app_font_size.dart';
import 'common_text.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      // height: media.width * 0.4,
      margin: const EdgeInsets.only(top: 5, right: 10, left: 10),
      padding: const EdgeInsets.only(bottom: 10, left: 10, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
              color: AppColors.grey.withOpacity(.2),
              blurRadius: 1,
              spreadRadius: 1,
              offset: const Offset(0.1, 0.3))
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
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
            child: const Icon(Icons.folder_open_outlined),
          ),
          SizedBox(width: media.width * 0.06),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CommonText(
                text: "General",
                fontColor: AppColors.black,
                fontSize: AppFontSize.sixteen,
                fontWeight: FontWeight.bold,
              ),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: AppColors.black.withOpacity(.3),
                    size: 15,
                  ),
                  SizedBox(width: media.width * 0.010),
                  CommonText(
                    text: "Dr.Paul",
                    fontColor: AppColors.black.withOpacity(.3),
                    fontSize: AppFontSize.sixteen,
                  ),
                ],
              ),
              SizedBox(height: media.height * 0.005),
              Container(
                padding: const EdgeInsets.only(
                    right: 15, left: 15, top: 1, bottom: 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.red.withOpacity(.3),
                ),
                child: const Center(
                    child: CommonText(
                  text: "8 files",
                )),
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.more_vert)
        ],
      ),
    );
  }
}
