import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/room.dart';
import '../../themes/app_colors.dart';
import '../../widgets/common_text.dart';
import '../../widgets/room/booking_card.dart';
import '../../widgets/room/recommendation.dart';

class RoomBooking extends StatelessWidget {
  const RoomBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      color: AppColors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: media.width / 1.18,
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
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        prefixIcon: Icon(Icons.search),
                        hintText: "search room",
                        hintStyle: TextStyle(fontFamily: "Oswald"),
                      ),
                    ),
                  ),
                  GestureDetector(onTap: () {}, child: const Icon(Icons.menu))
                ],
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 3 / 1),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return RoomRecommendationContainer(
                    text: index == 0
                        ? "Air Conditioned"
                        : index == 1
                            ? "Deluxe Double"
                            : index == 2
                                ? "Single"
                                : "",
                    index: index,
                    onPressed: () {
                      RoomBookingController.to.recommendationButtonIndex =
                          index;
                      if (index == 0) {
                        print("Index value in 0");
                        RoomBookingController.to.recommendationButtonIndex = 0;
                      } else if (index == 1) {
                        print("Index value in 1");
                        RoomBookingController.to.recommendationButtonIndex = 1;
                      } else if (index == 2) {
                        print("Index value in 2");
                        RoomBookingController.to.recommendationButtonIndex = 2;
                      }
                    },
                  );
                },
              ),
              Obx(() => roomRecommendationButton()),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  CommonText(
                    text: "See All",
                    fontColor: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(width: 20),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                child: CommonText(
                  text: "Recently Booked",
                  fontColor: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Obx(() => recentlyBooked()),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  CommonText(
                    text: "See All",
                    fontColor: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

roomRecommendationButton() {
  if (RoomBookingController.to.recommendationButtonIndex == 0) {
    return SizedBox(
      height: Get.height * 0.3,
      child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return RoomBookingCard(
              roomName: "Delux",
              roomNumber: "105",
              amount: "500",
              imageUrl: const DecorationImage(
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.srgbToLinearGamma(),
                  image: NetworkImage(
                      "https://www.sriramakrishnahospital.com/wp-content/uploads/2020/09/4-1.png")),
              onPressed: () {},
            );
          }),
    );
  } else if (RoomBookingController.to.recommendationButtonIndex == 1) {
    return SizedBox(
      height: Get.height * 0.3,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return RoomBookingCard(
              roomName: "Super Delux",
              roomNumber: "9865",
              amount: "1500",
              imageUrl: const DecorationImage(
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.srgbToLinearGamma(),
                  image: NetworkImage(
                      "https://www.sriramakrishnahospital.com/wp-content/uploads/2020/09/4-1.png")),
              onPressed: () {},
            );
          }),
    );
  } else if (RoomBookingController.to.recommendationButtonIndex == 2) {
    return SizedBox(
      height: Get.height * 0.3,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return RoomBookingCard(
              roomName: "Delux",
              roomNumber: "105",
              amount: "500",
              imageUrl: const DecorationImage(
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.srgbToLinearGamma(),
                  image: NetworkImage(
                      "https://www.sriramakrishnahospital.com/wp-content/uploads/2020/09/4-1.png")),
              onPressed: () {},
            );
          }),
    );
  }
}

recentlyBooked() {
  if (RoomBookingController.to.recommendationButtonIndex == 0) {
    return SizedBox(
      height: Get.height * 0.3,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return RoomBookingCard(
              roomName: "Delux",
              roomNumber: "105",
              amount: "500",
              imageUrl: const DecorationImage(
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.srgbToLinearGamma(),
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmDw5hv_Dn-LB1ElLrVS-Hi4jGvsGp2s-PlA&usqp=CAU")),
              onPressed: () {},
            );
          }),
    );
  } else if (RoomBookingController.to.recommendationButtonIndex == 1) {
    return SizedBox(
      height: Get.height * 0.3,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return RoomBookingCard(
              roomName: "Delux",
              roomNumber: "105",
              amount: "500",
              imageUrl: const DecorationImage(
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.srgbToLinearGamma(),
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmDw5hv_Dn-LB1ElLrVS-Hi4jGvsGp2s-PlA&usqp=CAU")),
              onPressed: () {},
            );
          }),
    );
  } else if (RoomBookingController.to.recommendationButtonIndex == 2) {
    return SizedBox(
      height: Get.height * 0.3,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return RoomBookingCard(
              roomName: "Delux",
              roomNumber: "105",
              amount: "500",
              imageUrl: const DecorationImage(
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.srgbToLinearGamma(),
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmDw5hv_Dn-LB1ElLrVS-Hi4jGvsGp2s-PlA&usqp=CAU")),
              onPressed: () {},
            );
          }),
    );
  }
}
