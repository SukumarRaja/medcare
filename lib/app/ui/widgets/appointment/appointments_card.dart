import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../common_text.dart';

class AppointmentsCard extends StatelessWidget {
  const AppointmentsCard(
      {Key? key,
      required this.doctorName,
      required this.specialist,
      required this.date,
      required this.time,
      required this.image,
      required this.onPressed,
      required this.status,
      required this.slots})
      : super(key: key);
  final String doctorName;
  final String specialist;
  final String date;
  final String time;
  final String image;
  final Function() onPressed;
  final String status;
  final String slots;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: media.width * 0.55,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
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
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        CommonText(text: "Doctor Name"),
                        CommonText(
                          text: "Treatment",
                        ),
                        CommonText(
                          text: "Date",
                        ),
                        CommonText(text: "Time"),
                        CommonText(
                          text: "Slots",
                        ),
                        CommonText(text: "Status"),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        CommonText(text: ":"),
                        CommonText(text: ":"),
                        CommonText(text: ":"),
                        CommonText(text: ":"),
                        CommonText(text: ":"),
                        CommonText(text: ":"),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(text: "Dr.$doctorName"),
                        CommonText(
                          text: specialist,
                        ),
                        CommonText(
                          text: date,
                        ),
                        CommonText(text: time),
                        CommonText(
                          text: slots,
                        ),
                        CommonText(
                          text: status,
                          fontColor: AppColors.green,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Image.network(
                          image,
                          fit: BoxFit.fitHeight,
                        ),
                        Positioned(
                            right: 2,
                            child: CommonText(
                              text: "2 days to go",
                              fontColor: AppColors.black.withOpacity(.3),
                              fontSize: AppFontSize.twelve,
                            ))
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
