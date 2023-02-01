import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../themes/app_colors.dart';
import '../../widgets/room/new_booking_card.dart';
import 'check_out.dart';
import 'detail.dart';

class RoomBooking extends StatelessWidget {
  const RoomBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.only(
                        right: 15.0, left: 15, top: 10, bottom: 10),
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
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        prefixIcon: Icon(Icons.search),
                        hintText: "search room",
                        hintStyle: TextStyle(fontFamily: "Oswald"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                      onTap: () {},
                      child: Container(
                          margin: const EdgeInsets.only(right: 15.0),
                          height: 50,
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
                          child: const Icon(Icons.menu))),
                )
              ],
            ),
            // GridView.builder(
            //   physics: const NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   padding: const EdgeInsets.only(
            //       left: 10, right: 10, top: 10, bottom: 0),
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 3,
            //       crossAxisSpacing: 5.0,
            //       mainAxisSpacing: 10.0,
            //       childAspectRatio: 3 / 1),
            //   itemCount: 3,
            //   itemBuilder: (context, index) {
            //     return RoomRecommendationContainer(
            //       text: index == 0
            //           ? "Air Conditioned"
            //           : index == 1
            //               ? "Deluxe Double"
            //               : index == 2
            //                   ? "Single"
            //                   : "",
            //       index: index,
            //       onPressed: () {
            //         RoomBookingController.to.recommendationButtonIndex =
            //             index;
            //         if (index == 0) {
            //           print("Index value in 0");
            //           RoomBookingController.to.recommendationButtonIndex = 0;
            //         } else if (index == 1) {
            //           print("Index value in 1");
            //           RoomBookingController.to.recommendationButtonIndex = 1;
            //         } else if (index == 2) {
            //           print("Index value in 2");
            //           RoomBookingController.to.recommendationButtonIndex = 2;
            //         }
            //       },
            //     );
            //   },
            // ),
            SizedBox(
              height: media.height * 0.8,
              child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, int index) {
                    return RoomBookingCardNew(
                      name: "Executive Suite",
                      size: "32",
                      amount: "250",
                      available: index == 0
                          ? "Available"
                          : index == 1
                              ? "Available"
                              : "Not Available",
                      image:
                          "https://insights.ehotelier.com/wp-content/uploads/sites/6/2020/01/hotel-room.jpg",
                      chooseButton: () {
                        Get.to(() => const RoomBookingCheckOut(
                              fromMain: true,
                            ));
                      },
                      onPressed: () {
                        Get.to(() => const RoomDetail());
                      },
                    );
                  }),
            ),
            SizedBox(
              height: media.height * 0.10,
            )
          ],
        ),
      ),
    );
  }
}
