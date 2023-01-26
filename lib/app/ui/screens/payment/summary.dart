import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../controller/payment.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_text.dart';
import '../../widgets/payment_method_card.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(Icons.arrow_back_ios)),
                    const Spacer(),
                    const CommonText(
                      text: "Payment Summary",
                      fontColor: AppColors.black,
                      fontSize: AppFontSize.twenty,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Container(
                  height: 50,
                  width: media.width,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.grey.withOpacity(.2),
                            spreadRadius: 1,
                            blurRadius: 2)
                      ]),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: SvgPicture.asset(
                            "assets/svgs/promo.svg",
                            height: 30,
                          )),
                      Expanded(
                        flex: 4,
                        child: TextFormField(
                          style: TextStyle(
                              fontFamily: "Oswald",
                              color: AppColors.black.withOpacity(.8)),
                          cursorColor: AppColors.primary,
                          decoration: const InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: "Apply a Promo Code",
                            hintStyle: TextStyle(fontFamily: "Oswald"),
                          ),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: const CommonText(
                          text: "Apply",
                          fontWeight: FontWeight.bold,
                          fontColor: AppColors.primary,
                          fontSize: AppFontSize.eighteen,
                        ),
                      ),
                      SizedBox(
                        width: media.width * 0.04,
                      )
                    ],
                  )),
              Container(
                width: media.width,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.grey.withOpacity(.2),
                          spreadRadius: 1,
                          blurRadius: 2)
                    ]),
                child: Column(
                  children: [
                    SizedBox(
                      height: media.width * 0.04,
                    ),
                    buildRow(media,
                        title: "Order Total", amount: "550", isAmount: true),
                    buildDivider(media),
                    buildRow(media,
                        title: "GST",
                        percentage: "18",
                        isAmount: true,
                        isPercentage: true,
                        amount: "45"),
                    buildDivider(media),
                    buildRow(media,
                        title: "CGST",
                        percentage: "12",
                        isPercentage: true,
                        isAmount: true,
                        amount: "25"),
                    buildDivider(media),
                    buildRow(media,
                        title: "Promo Discount", amount: "12", isAmount: true),
                    buildDivider(media),
                    buildRow(media,
                        title: "Total", amount: "715", isAmount: true),
                    SizedBox(height: media.height * 0.02)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: media.width * 0.06),
                child: const CommonText(
                  text: "Payment Method",
                  fontSize: AppFontSize.eighteen,
                ),
              ),
              PaymentMethodCard(
                text: "Razor Pay",
                image: "razorpay",
                index: 0,
                onPressed: () {
                  PaymentController.to.paymentMethodSelectIndex = 0;
                },
              ),
              PaymentMethodCard(
                text: "Google Pay",
                image: "google_pay",
                index: 1,
                onPressed: () {
                  PaymentController.to.paymentMethodSelectIndex = 1;
                },
              ),
              PaymentMethodCard(
                text: "Phonepe",
                image: "phonepe",
                index: 2,
                onPressed: () {
                  PaymentController.to.paymentMethodSelectIndex = 2;
                },
              ),
              PaymentMethodCard(
                text: "Upi",
                image: "upi",
                index: 3,
                onPressed: () {
                  PaymentController.to.paymentMethodSelectIndex = 3;
                },
              ),
              PaymentMethodCard(
                text: "Cash On Delivery",
                image: "cash_on_delivery",
                index: 4,
                onPressed: () {
                  PaymentController.to.paymentMethodSelectIndex = 4;
                },
              ),
              CommonButton(
                text: "Checkout",
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildRow(Size media,
      {required title,
      String? amount,
      bool isAmount = false,
      bool isPercentage = false,
      String? percentage}) {
    return Row(
      children: [
        SizedBox(
          width: media.width * 0.06,
        ),
        CommonText(text: title),
        isPercentage == true
            ? SizedBox(
                width: media.width * 0.01,
              )
            : const SizedBox(),
        isPercentage == true
            ? CommonText(
                text: "$percentage %",
                fontSize: AppFontSize.fourteen,
                fontColor: AppColors.black.withOpacity(.6),
              )
            : const SizedBox(),
        const Spacer(),
        isAmount == true
            ? CommonText(
                text: "\u{20B9} $amount",
                fontColor: title == "Promo Discount"
                    ? AppColors.green
                    : AppColors.black,
              )
            : const SizedBox(),

        // CommonText(
        //     text: isAmount == true ? "\u{20B9} $amount" : "$percentage %"),
        SizedBox(
          width: media.width * 0.06,
        ),
      ],
    );
  }

  Padding buildDivider(Size media) {
    return Padding(
      padding: EdgeInsets.only(
          right: media.width * 0.06,
          left: media.width * 0.06,
          top: 4,
          bottom: 2),
      child: Divider(
        color: AppColors.black.withOpacity(.3),
      ),
    );
  }
}
