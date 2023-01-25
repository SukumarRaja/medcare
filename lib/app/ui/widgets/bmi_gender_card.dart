import 'package:flutter/material.dart';

import 'common_text.dart';

class BmiGenderCard extends StatelessWidget {
  const BmiGenderCard(
      {Key? key,
      required this.genderIcon,
      required this.gender,
      required this.color,
      required this.fontColor})
      : super(key: key); //remove required
  final IconData genderIcon;
  final String gender;
  final Color color;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            genderIcon,
            size: 18,
          ),
          const SizedBox(height: 15),
          CommonText(
            text: gender,
            fontColor: fontColor,
          ),
        ],
      ),
    );
  }
}
