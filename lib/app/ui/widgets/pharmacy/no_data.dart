import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../common_text.dart';

class PharmacyNoData extends StatelessWidget {
  const PharmacyNoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
          bottom: 60,
          right: 10,
          left: 10,
          child: Center(
            child: CommonText(
              text: "Sorry no data found",
              fontSize: AppFontSize.eighteen,
            ),
          ),
        ),
        Positioned(
            bottom: 25,
            right: 10,
            left: 10,
            child: Center(
                child: CommonText(
              text: "Please select prescription then get your data",
              fontSize: AppFontSize.fourteen,
              fontColor: AppColors.black.withOpacity(.4),
            ))),
        SvgPicture.asset("assets/svgs/no_data.svg"),
      ],
    );
  }
}
