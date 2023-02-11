import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../common_text.dart';

class BedCard extends StatelessWidget {
  const BedCard({
    Key? key,
    required this.title,
    required this.message,
    required this.ago,
  }) : super(key: key);
  final String title;
  final String message;
  final String ago;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      width: media.width * 0.55,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
              color: AppColors.grey.withOpacity(.2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0.3, 0.2))
        ],
      ),
      child: Row(
        children: [
          Container(
            height: media.height * 0.05,
            width: media.width * 0.13,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(10.0),
              shape: BoxShape.circle,
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                    color: AppColors.grey.withOpacity(.2),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0.3, 0.2))
              ],
            ),
            child: SvgPicture.asset("assets/svgs/bed.svg"),
          ),
          SizedBox(
            width: media.width * 0.04,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(text: "Bed Id"),
              CommonText(
                text: "Allotted Time",
                fontColor: AppColors.black.withOpacity(.6),
                fontSize: AppFontSize.fourteen,
              ),
              CommonText(
                text: "Discharge Time",
                fontColor: AppColors.black.withOpacity(.6),
                fontSize: AppFontSize.fourteen,
              ),
            ],
          ),
          SizedBox(
            width: media.width * 0.02,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(text: ":"),
              CommonText(text: ":"),
              CommonText(text: ":"),
            ],
          ),
          SizedBox(
            width: media.width * 0.02,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(text: title),
              CommonText(
                text: message,
                fontColor: AppColors.black.withOpacity(.6),
                fontSize: AppFontSize.fourteen,
              ),
              CommonText(
                text: ago,
                fontColor: AppColors.black.withOpacity(.6),
                fontSize: AppFontSize.fourteen,
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10,bottom: 2),
                padding:
                    EdgeInsets.only(right: 15.0, left: 15.0, top: 3, bottom: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: AppColors.primary,
                  gradient: const LinearGradient(
                      colors: [AppColors.primary, AppColors.buttonGradient],
                      begin: Alignment.topRight,
                      end: Alignment.topLeft),
                ),
                child: Center(
                    child: CommonText(
                  text: "More",
                  fontColor: AppColors.white,
                )),
              ),


              Container(
                margin: EdgeInsets.only(top: 10,bottom: 10),

                padding:
                EdgeInsets.only(right: 10.0, left: 10.0, top: 3, bottom: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: AppColors.primary,
                  gradient: const LinearGradient(
                      colors: [AppColors.primary, AppColors.buttonGradient],
                      begin: Alignment.topRight,
                      end: Alignment.topLeft),
                ),
                child: Center(
                    child: CommonText(
                      text: "Report",
                      fontColor: AppColors.white,
                    )),
              ),

            ],
          ),
          SizedBox(width: media.width * 0.04),
        ],
      ),
    );
  }
}
