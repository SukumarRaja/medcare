import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/appointment.dart';
import '../../themes/app_colors.dart';
import '../common_text.dart';

class AfternoonSlots extends StatelessWidget {
  const AfternoonSlots({Key? key}) : super(key: key);

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
          return Obx(
            () => GestureDetector(
              onTap: () {
                // AppointmentController.to
                //     .addSelectedSlots(id: index, value: "ljlk");
              },
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: AppointmentController.to.selectedSlots.isEmpty
                        ? AppColors.grey.withOpacity(.1)
                        : Colors.red,
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
                    text: "01:30 pm",
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
