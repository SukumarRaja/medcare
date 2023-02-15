import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../themes/app_colors.dart';

class CommonLoading extends StatelessWidget {
  const CommonLoading(
      {Key? key, this.color = AppColors.primary, this.size = 80})
      : super(key: key);
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SpinKitPulse(
      color: color,
      size: size,
    );
  }
}

class CommonNormalLoading extends StatelessWidget {
  const CommonNormalLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(
          backgroundColor: AppColors.grey.withOpacity(.5),
          valueColor: const AlwaysStoppedAnimation(AppColors.buttonGradient),
          strokeWidth: 5.3,
        ),
      ),
    );
  }
}
