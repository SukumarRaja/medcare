import 'package:flutter/material.dart';
import '../themes/app_colors.dart';
import '../themes/app_font_size.dart';
import 'common_text.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
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
            height: media.height * 0.06,
            width: media.width * 0.15,
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
            child: Icon(
              Icons.notifications,
              color: AppColors.black.withOpacity(.4),
            ),
          ),
          SizedBox(
            width: media.width * 0.04,
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
            ],
          ),
          const Spacer(),
          CommonText(
            text: "$ago days ago",
            fontSize: AppFontSize.twelve,
            fontColor: AppColors.black.withOpacity(.4),
          ),
          SizedBox(width: media.width * 0.02)
        ],
      ),
    );
  }
}
