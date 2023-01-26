import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/pharmacy.dart';
import '../themes/app_colors.dart';
import '../themes/app_font_size.dart';
import '../widgets/common_text.dart';
import '../widgets/pharmacy/medicines.dart';
import '../widgets/pharmacy/no_data.dart';
import '../widgets/pharmacy/prescription.dart';
import 'payment/summary.dart';

class PharmacyOnPhone extends StatelessWidget {
  const PharmacyOnPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      bottomSheet: Obx(() => PharmacyController.to.isPrescriptionViewed == true
          ? buildContainer(media)
          : const SizedBox()),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                      text: "Pharmacy On Phone",
                      fontColor: AppColors.black,
                      fontSize: AppFontSize.twenty,
                    ),
                    const Spacer(),
                    Stack(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 1.0, right: 5.0),
                          child: Icon(
                            Icons.shopping_cart,
                            color: AppColors.primary,
                            size: 30,
                          ),
                        ),
                        // Obx(() => PharmacyController.to.cartCount == "0"
                        Obx(() => PharmacyController.to.cartCount == "1"
                            ? const SizedBox()
                            : Positioned(
                                right: 0,
                                child: Container(
                                  height: 15,
                                  width: 15,
                                  decoration: const BoxDecoration(
                                      color: AppColors.red,
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: CommonText(
                                      text: PharmacyController.to.cartCount,
                                      fontColor: AppColors.white,
                                      fontSize: AppFontSize.ten,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ))
                      ],
                    )
                  ],
                ),
              ),
              Obx(() => PharmacyController.to.isPrescriptionViewed == false
                  ? Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: AppColors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.grey.withOpacity(.4),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    // offset: Offset(0.2, 0.6)
                                  )
                                ]),
                            child: TextFormField(
                              style: TextStyle(
                                  fontFamily: "Oswald",
                                  color: AppColors.black.withOpacity(.8)),
                              cursorColor: AppColors.primary,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                prefixIcon: Icon(Icons.search),
                                hintText: "search or filter prescription",
                                hintStyle: TextStyle(fontFamily: "Oswald"),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                              onTap: () {
                                PharmacyController.to.initialPrescriptionEmpty =
                                    false;
                                PharmacyController.to.isPrescriptionViewed =
                                    false;
                              },
                              child: Container(
                                  height: 50,
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: AppColors.primary),
                                  child: const Icon(
                                    Icons.menu,
                                    color: AppColors.white,
                                  ))),
                        )
                      ],
                    )
                  : const SizedBox()),
              Obx(() => PharmacyController.to.initialPrescriptionEmpty == true
                  ? const PharmacyNoData()
                  : PharmacyController.to.isPrescriptionViewed == true
                      ? const SizedBox()
                      : GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 0),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5.0,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: 1 / 1),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return PrescriptionCard(
                              prescriptionName: "Viral Fever",
                              pillsOrQty: "90",
                              generatedDate: "12/01/2020",
                              previousAmount: "120",
                              onPressed: () {
                                PharmacyController.to.isPrescriptionViewed =
                                    true;
                              },
                            );
                          },
                        )),
              Obx(() => PharmacyController.to.isPrescriptionViewed == true
                  ? ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, int index) {
                        return Obx(() => MedicinesCard(
                              medicineImage:
                                  "https://png.pngtree.com/png-vector/20220527/ourmid/pngtree-blue-and-red-medical-pills-png-image_4757001.png",
                              medicineName: "Multivitamin",
                              amount: "150",
                              count: PharmacyController
                                  .to.prescriptionMedicineCount
                                  .toString(),
                              addPressed: () {
                                debugPrint("Add Pressed");
                                PharmacyController.to.addMedicineCount();
                              },
                              removePressed: () {
                                debugPrint("Remove Pressed");
                                PharmacyController.to.removeMedicineCount();
                              },
                              deletePressed: () {
                                debugPrint("delete Pressed");
                              },
                            ));
                      })
                  : const SizedBox()),
              SizedBox(
                height: media.height * 0.09,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildContainer(Size media) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () {
              Get.to(() => const PaymentSummary());
            },
            child: Container(
              height: 50,
              width: media.width,
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.primary,
                gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.buttonGradient],
                    begin: Alignment.topRight,
                    end: Alignment.topLeft),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CommonText(
                    text: "Add Cart",
                    fontColor: AppColors.white,
                    fontSize: AppFontSize.eighteen,
                  ),
                  SizedBox(
                    width: media.width * 0.03,
                  ),
                  const Icon(
                    Icons.add_shopping_cart,
                    color: AppColors.white,
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () {
              Get.to(() => const PaymentSummary());
            },
            child: Container(
              height: 50,
              width: media.width,
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.primary,
                gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.buttonGradient],
                    begin: Alignment.topRight,
                    end: Alignment.topLeft),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CommonText(
                    text: "Re Order",
                    fontColor: AppColors.white,
                    fontSize: AppFontSize.eighteen,
                  ),
                  SizedBox(
                    width: media.width * 0.03,
                  ),
                  const Icon(
                    Icons.shopping_bag_rounded,
                    color: AppColors.white,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
