import 'package:flutter/material.dart';
import '../themes/app_colors.dart';
import '../themes/app_font_size.dart';

class CommonText extends StatelessWidget {
  const CommonText(
      {Key? key,
      required this.text,
      this.fontSize = AppFontSize.sixteen,
      this.fontColor = AppColors.black,
      this.fontWeight,
      this.letterSpacing,
      this.textAlign})
      : super(key: key);
  final String text;
  final double fontSize;
  final double? letterSpacing;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: media.width * fontSize,
          fontWeight: fontWeight,
          color: fontColor,
          fontFamily: "Oswald",
          letterSpacing: letterSpacing),
    );
  }
}
