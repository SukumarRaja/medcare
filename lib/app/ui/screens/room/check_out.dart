import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medcare/app/controller/auth.dart';
import 'package:medcare/app/controller/main.dart';
import 'package:medcare/app/ui/widgets/common_textform_field.dart';
import '../../../controller/payment.dart';
import '../../../controller/room.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../../widgets/common_alert.dart';
import '../../widgets/common_text.dart';
import '../../widgets/intl_phone_field.dart';
import '../../widgets/room/book_and_review.dart';
import '../../widgets/room/chechout/add_contact_detail.dart';
import '../../widgets/room/chechout/payment.dart';
import '../../widgets/room/chechout/status_container.dart';

class RoomBookingCheckOut extends StatelessWidget {
  const RoomBookingCheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Material(
      child: Container(
        color: AppColors.white,
        child: Stack(
          children: [
            // gradient container
            Container(
              height: media.height / 3.7,
              width: media.width,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(50.0)),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.grey.withOpacity(.4),
                      blurRadius: 1,
                      spreadRadius: 1)
                ],
                gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.buttonGradient],
                    begin: Alignment.topRight,
                    end: Alignment.topLeft),
              ),
            ),

            // back button and title
            Positioned(
                top: media.height * 0.06,
                left: media.width * 0.04,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (RoomBookingController.to.isAddContactDetail ==
                                true) {
                              RoomBookingController.to.isAddContactDetail =
                                  false;
                              RoomBookingController.to.isCheckoutStatus = true;
                            } else {
                              Get.back();
                            }
                          },
                          child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: AppColors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.grey.withOpacity(.4),
                                        blurRadius: 1,
                                        spreadRadius: 1)
                                  ]),
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                size: 22,
                                color: AppColors.black.withOpacity(.7),
                              )),
                        ),
                        SizedBox(
                          width: media.width * 0.10,
                        ),
                        Obx(() =>
                            RoomBookingController.to.isAddContactDetail == true
                                ? const CommonText(
                                    text: "Add Contact Details",
                                    fontColor: AppColors.white,
                                    fontSize: AppFontSize.twentyFour,
                                    fontWeight: FontWeight.bold,
                                  )
                                : const CommonText(
                                    text: "Checkout",
                                    fontColor: AppColors.white,
                                    fontSize: AppFontSize.twentyFour,
                                    fontWeight: FontWeight.bold,
                                  ))
                      ],
                    ),
                    SizedBox(
                      height: media.height * 0.07,
                    ),

                    // Track status
                    Obx(() =>
                        RoomBookingController.to.isAddContactDetail == true
                            ? const SizedBox()
                            : Row(
                                children: const [
                                  //book and review
                                  StatusContainer(
                                    statusNumber: "1",
                                    status: "Book and Review",
                                  ),

                                  //payment
                                  StatusContainerPayment(
                                    statusNumber: "2",
                                    status: "Payment",
                                  ),

                                  //confirm
                                  StatusContainerConfirm(
                                    statusNumber: "3",
                                    status: "Confirm",
                                  ),
                                ],
                              ))
                  ],
                )),

            // room details container
            Obx(() => RoomBookingController.to.isCheckoutStatus == true
                ? Positioned(
                    top: 190,
                    right: 2,
                    left: 2,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // room detail
                          BookAndReviewCard(
                            name: "Executive Suite",
                            size: "32",
                            amount: "250",
                            image:
                                "https://insights.ehotelier.com/wp-content/uploads/sites/6/2020/01/hotel-room.jpg",
                            chooseButton: () {},
                            onPressed: () {},
                          ),

                          // add contact detail
                          AddContactDetail(
                            onPressed: () {
                              RoomBookingController.to.isAddContactDetail =
                                  true;
                              RoomBookingController.to.isCheckoutStatus = false;
                              debugPrint("Add contact pressed");
                            },
                          ),

                          // add promo code
                          AddPromoCode(
                            onPressed: () {
                              debugPrint("Add contact pressed");
                            },
                          ),
                        ],
                      ),
                    ),
                  )

                // payment design
                : RoomBookingController.to.isPaymentCheckoutStatus == true
                    ? Positioned(
                        top: 200,
                        right: 2,
                        left: 2,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              PaymentMethodCardForRoomBooking(
                                text: "Razor Pay",
                                image: "razorpay",
                                index: 0,
                                onPressed: () {
                                  PaymentController.to
                                      .roomBookingPaymentMethodSelectIndex = 0;
                                },
                              ),
                              PaymentMethodCardForRoomBooking(
                                text: "Google Pay",
                                image: "google_pay",
                                index: 1,
                                onPressed: () {
                                  PaymentController.to
                                      .roomBookingPaymentMethodSelectIndex = 1;
                                },
                              ),
                              PaymentMethodCardForRoomBooking(
                                text: "Phonepe",
                                image: "phonepe",
                                index: 2,
                                onPressed: () {
                                  PaymentController.to
                                      .roomBookingPaymentMethodSelectIndex = 2;
                                },
                              ),
                              PaymentMethodCardForRoomBooking(
                                text: "Upi",
                                image: "upi",
                                index: 3,
                                onPressed: () {
                                  PaymentController.to
                                      .roomBookingPaymentMethodSelectIndex = 3;
                                },
                              ),
                              PaymentMethodCardForRoomBooking(
                                text: "Cash On Delivery",
                                image: "cash_on_delivery",
                                index: 4,
                                onPressed: () {
                                  PaymentController.to
                                      .roomBookingPaymentMethodSelectIndex = 4;
                                },
                              ),
                            ],
                          ),
                        ),
                      )

                    //confirm page
                    : RoomBookingController.to.isConfirmCheckoutStatus == true
                        ? Positioned(
                            top: 190,
                            right: 2,
                            left: 2,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  // room detail
                                  BookAndReviewCard(
                                    name: "Executive Suite",
                                    size: "32",
                                    amount: "250",
                                    image:
                                        "https://insights.ehotelier.com/wp-content/uploads/sites/6/2020/01/hotel-room.jpg",
                                    chooseButton: () {},
                                    onPressed: () {},
                                  ),

                                  // add contact detail
                                  ConfirmContactDetail(
                                    onPressed: () {
                                      debugPrint("Add contact pressed");
                                    },
                                  ),
                                  PaymentConfirmCard(
                                    text: "Cash On Delivery",
                                    image: "cash_on_delivery",
                                    index: 4,
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox()),

            // payment buttons

            Obx(() => RoomBookingController.to.isCheckoutStatus == true
                ? Positioned(
                    bottom: 10,
                    right: 2,
                    left: 2,
                    child: GestureDetector(
                      onTap: () {
                        RoomBookingController.to.isPaymentCheckoutStatus = true;
                        RoomBookingController.to.paymentCheckoutStatus =
                            "Payment";
                        RoomBookingController.to.isCheckoutStatus = false;
                      },
                      child: Container(
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.grey.withOpacity(.2),
                                  blurRadius: 1,
                                  spreadRadius: 1)
                            ],
                            gradient: const LinearGradient(
                                colors: [
                                  AppColors.primary,
                                  AppColors.buttonGradient
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.topLeft),
                          ),
                          child: const Center(
                              child: CommonText(
                            text: "Payment",
                            fontColor: AppColors.white,
                            fontSize: AppFontSize.twenty,
                            fontWeight: FontWeight.bold,
                          ))),
                    ),
                  )
                : RoomBookingController.to.isPaymentCheckoutStatus == true
                    ? Positioned(
                        bottom: 10,
                        right: 2,
                        left: 2,
                        child: GestureDetector(
                          onTap: () {
                            RoomBookingController.to.confirmCheckoutStatus =
                                "Confirm";
                            RoomBookingController.to.isConfirmCheckoutStatus =
                                true;
                            RoomBookingController.to.isPaymentCheckoutStatus =
                                false;
                          },
                          child: Container(
                              padding: const EdgeInsets.all(15),
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: AppColors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.grey.withOpacity(.2),
                                      blurRadius: 1,
                                      spreadRadius: 1)
                                ],
                                gradient: const LinearGradient(
                                    colors: [
                                      AppColors.primary,
                                      AppColors.buttonGradient
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.topLeft),
                              ),
                              child: const Center(
                                  child: CommonText(
                                text: "Confirm",
                                fontColor: AppColors.white,
                                fontSize: AppFontSize.twenty,
                                fontWeight: FontWeight.bold,
                              ))),
                        ),
                      )
                    : RoomBookingController.to.isConfirmCheckoutStatus == true
                        ? Positioned(
                            bottom: 10,
                            right: 2,
                            left: 2,
                            child: GestureDetector(
                              onTap: () {
                                successAlert(context,
                                    content: "Booking Successfully",
                                    confirmButtonPressed: () {
                                  Get.back();
                                  Get.back();
                                  Get.back();
                                  MainController.to.pageIndex = 2;
                                });
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(15),
                                  margin: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.0),
                                    color: AppColors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColors.grey.withOpacity(.2),
                                          blurRadius: 1,
                                          spreadRadius: 1)
                                    ],
                                    gradient: const LinearGradient(
                                        colors: [
                                          AppColors.primary,
                                          AppColors.buttonGradient
                                        ],
                                        begin: Alignment.topRight,
                                        end: Alignment.topLeft),
                                  ),
                                  child: const Center(
                                      child: CommonText(
                                    text: "Pay Now",
                                    fontColor: AppColors.white,
                                    fontSize: AppFontSize.twenty,
                                    fontWeight: FontWeight.bold,
                                  ))),
                            ),
                          )
                        : const SizedBox()),

            // add contact details card or popup
            Obx(() => RoomBookingController.to.isAddContactDetail == true
                ? Center(
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CommonTextFormField(
                            hintText: "Name",
                            controller: AuthController.to.lEmail),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IntlPhoneField(
                            maxLength: 10,
                            hintText: "Phone",
                            controller: AuthController.to.lPassword,
                            initialCountryCode: "IN",
                            fontFamily: "Oswald",
                            validator: (data) {
                              if (data!.isEmpty || data == "") {
                                return "Phone field required";
                              } else if (data.length < 10) {
                                return "Phone number must be 10 character";
                              }
                              return null;
                            },
                          ),
                        ),
                        CommonTextFormField(
                            hintText: "Email",
                            controller: AuthController.to.lEmail),
                        GestureDetector(
                          onTap: () {
                            RoomBookingController.to.isAddContactDetail = false;
                            RoomBookingController.to.isCheckoutStatus = true;
                          },
                          child: Container(
                              padding: const EdgeInsets.all(15),
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: AppColors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.grey.withOpacity(.2),
                                      blurRadius: 1,
                                      spreadRadius: 1)
                                ],
                                gradient: const LinearGradient(
                                    colors: [
                                      AppColors.primary,
                                      AppColors.buttonGradient
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.topLeft),
                              ),
                              child: const Center(
                                  child: CommonText(
                                text: "Add",
                                fontColor: AppColors.white,
                                fontSize: AppFontSize.twenty,
                                fontWeight: FontWeight.bold,
                              ))),
                        )
                      ],
                    ),
                  ))
                : const SizedBox())
          ],
        ),
      ),
    );
  }
}
