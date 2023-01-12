import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';
import '../common_text.dart';

class ConfirmationSlots extends StatelessWidget {
  const ConfirmationSlots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 15,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2, crossAxisCount: 4),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: AppColors.primary.withOpacity(.4),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.white.withOpacity(.3),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0.1, 0.6),
                  )
                ]),
            child: const Center(
              child: CommonText(
                text: "10:30 am",
              ),
            ),
          );
        },
      ),
    );
  }
}
