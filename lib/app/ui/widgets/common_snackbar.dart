import 'package:flutter/material.dart';
import 'package:get/get.dart';

commonSnackBar({required title, required msg}) {
  Get.snackbar(title, msg, snackPosition: SnackPosition.BOTTOM);
}
