import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'common_text.dart';

class NoDoctors extends StatelessWidget {
  const NoDoctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            height: media.width / 3,
            child: SvgPicture.asset("assets/svgs/no_data.svg")),
        const CommonText(text: "No doctors")
      ],
    );
  }
}

class NoData extends StatelessWidget {
  const NoData({Key? key, required this.msg}) : super(key: key);
  final String msg;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            // height: media.width / 3,
            child: SvgPicture.asset("assets/svgs/no_data.svg")),
         CommonText(text: msg)
      ],
    );
  }
}
