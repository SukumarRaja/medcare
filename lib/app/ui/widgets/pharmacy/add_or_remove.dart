import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class AddOrRemove extends StatelessWidget {
  const AddOrRemove({Key? key, required this.icon, required this.onPressed})
      : super(key: key);
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                  color: AppColors.grey.withOpacity(.2),
                  spreadRadius: 1,
                  blurRadius: 2)
            ]),
        child: Center(
            child: Icon(
          icon,
          weight: 10,
          shadows: const [Shadow(color: AppColors.grey, blurRadius: 1)],
          color: AppColors.primary,
          size: 20,
        )),
      ),
    );
  }
}
