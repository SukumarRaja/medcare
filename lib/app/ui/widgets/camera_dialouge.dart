import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/file.dart';
import '../themes/app_colors.dart';
import 'common_text.dart';

cameraDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Row(
              children: [
                const Text("Choose"),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.close,
                    color: AppColors.red,
                  ),
                )
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                    FileController.to.selectCamera();
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.camera_alt,
                        color: AppColors.primary,
                      ),
                      SizedBox(width: 15),
                      CommonText(text: "Pick from camera")
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Get.back();
                    FileController.to.selectGallery();
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.camera_alt,
                        color: AppColors.primary,
                      ),
                      SizedBox(width: 15),
                      CommonText(text: "Pick from gallery")
                    ],
                  ),
                ),
              ],
            ),
          ));
}
