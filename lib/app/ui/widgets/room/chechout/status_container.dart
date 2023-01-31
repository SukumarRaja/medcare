import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/room.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_font_size.dart';
import '../../common_text.dart';

class StatusContainer extends StatelessWidget {
  const StatusContainer(
      {Key? key, required this.statusNumber, required this.status})
      : super(key: key);
  final String statusNumber;
  final String status;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Obx(
      () => Row(
        children: [
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: RoomBookingController.to.checkoutStatus == status
                  ? AppColors.white
                  : AppColors.white.withOpacity(.1),
              boxShadow: [
                BoxShadow(
                    color: AppColors.grey.withOpacity(.6),
                    blurRadius: 1,
                    spreadRadius: 1)
              ],
            ),
            child: Center(
                child: CommonText(
              text: statusNumber,
              fontSize: AppFontSize.fourteen,
              fontColor: RoomBookingController.to.checkoutStatus == status
                  ? AppColors.black
                  : AppColors.white,
            )),
          ),
          SizedBox(width: media.width * 0.02),
          CommonText(
            text: status,
            fontSize: AppFontSize.fourteen,
            fontColor: RoomBookingController.to.checkoutStatus == status
                ? AppColors.white
                : AppColors.white.withOpacity(.5),
            fontWeight: FontWeight.bold,
          ),
          SizedBox(width: media.width * 0.02),
          status == "Confirm"
              ? const SizedBox()
              : const SizedBox(
                  width: 15,
                  child: Divider(
                    color: AppColors.white,
                    thickness: 2,
                  ),
                ),
          SizedBox(width: media.width * 0.02),
        ],
      ),
    );
  }
}

class StatusContainerPayment extends StatelessWidget {
  const StatusContainerPayment(
      {Key? key, required this.statusNumber, required this.status})
      : super(key: key);
  final String statusNumber;
  final String status;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Obx(
      () => Row(
        children: [
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: RoomBookingController.to.paymentCheckoutStatus == status
                  ? AppColors.white
                  : AppColors.white.withOpacity(.1),
              boxShadow: [
                BoxShadow(
                    color: AppColors.grey.withOpacity(.6),
                    blurRadius: 1,
                    spreadRadius: 1)
              ],
            ),
            child: Center(
                child: CommonText(
              text: statusNumber,
              fontSize: AppFontSize.fourteen,
              fontColor:
                  RoomBookingController.to.paymentCheckoutStatus == status
                      ? AppColors.black
                      : AppColors.white,
            )),
          ),
          SizedBox(width: media.width * 0.02),
          CommonText(
            text: status,
            fontSize: AppFontSize.fourteen,
            fontColor: RoomBookingController.to.paymentCheckoutStatus == status
                ? AppColors.white
                : AppColors.white.withOpacity(.5),
            fontWeight: FontWeight.bold,
          ),
          SizedBox(width: media.width * 0.02),
          status == "Confirm"
              ? const SizedBox()
              : const SizedBox(
                  width: 15,
                  child: Divider(
                    color: AppColors.white,
                    thickness: 2,
                  ),
                ),
          SizedBox(width: media.width * 0.02),
        ],
      ),
    );
  }
}

class StatusContainerConfirm extends StatelessWidget {
  const StatusContainerConfirm(
      {Key? key, required this.statusNumber, required this.status})
      : super(key: key);
  final String statusNumber;
  final String status;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Obx(
      () => Row(
        children: [
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: RoomBookingController.to.confirmCheckoutStatus == status
                  ? AppColors.white
                  : AppColors.white.withOpacity(.1),
              boxShadow: [
                BoxShadow(
                    color: AppColors.grey.withOpacity(.6),
                    blurRadius: 1,
                    spreadRadius: 1)
              ],
            ),
            child: Center(
                child: CommonText(
              text: statusNumber,
              fontSize: AppFontSize.fourteen,
              fontColor:
                  RoomBookingController.to.confirmCheckoutStatus == status
                      ? AppColors.black
                      : AppColors.white,
            )),
          ),
          SizedBox(width: media.width * 0.02),
          CommonText(
            text: status,
            fontSize: AppFontSize.fourteen,
            fontColor: RoomBookingController.to.confirmCheckoutStatus == status
                ? AppColors.white
                : AppColors.white.withOpacity(.5),
            fontWeight: FontWeight.bold,
          ),
          SizedBox(width: media.width * 0.02),
          status == "Confirm"
              ? const SizedBox()
              : const SizedBox(
                  width: 15,
                  child: Divider(
                    color: AppColors.white,
                    thickness: 2,
                  ),
                ),
          SizedBox(width: media.width * 0.02),
        ],
      ),
    );
  }
}
