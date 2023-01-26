import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../common_text.dart';

class FamilyListCard extends StatelessWidget {
  const FamilyListCard(
      {Key? key,
      required this.name,
      required this.phone,
      required this.bloodGroup,
      required this.lastCheckup,
      required this.deletePressed,
      required this.viewPressed,
      required this.updatePressed,
      required this.image,
      required this.onPressed})
      : super(key: key);
  final String name;
  final String image;
  final String phone;
  final String bloodGroup;
  final String lastCheckup;
  final Function() deletePressed;
  final Function() viewPressed;
  final Function() updatePressed;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: media.width,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                  color: AppColors.grey.withOpacity(.2),
                  spreadRadius: 1,
                  blurRadius: 2)
            ]),
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      height: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              fit: BoxFit.cover, image: NetworkImage(image))),
                    )),
                SizedBox(width: media.width * 0.02),
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CommonText(
                          text: name,
                          fontSize: AppFontSize.sixteen,
                        ),
                        CommonText(
                          text: phone,
                          fontSize: AppFontSize.sixteen,
                        ),
                        CommonText(
                          text: bloodGroup,
                          fontSize: AppFontSize.sixteen,
                        ),
                        Row(
                          children: [
                            CommonText(
                              text: lastCheckup,
                              fontSize: AppFontSize.fourteen,
                            ),
                            SizedBox(width: media.width * 0.01),
                            const CommonText(
                              text: "(last checkup)",
                              fontSize: AppFontSize.twelve,
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
            Positioned(
              bottom: 5,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // remove button
                  // GestureDetector(
                  //   onTap: viewPressed,
                  //   child: Container(
                  //     margin: const EdgeInsets.all(8.0),
                  //     padding: const EdgeInsets.only(
                  //         top: 2.0, bottom: 2.0, right: 15.0, left: 15.0),
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(4.0),
                  //         color: AppColors.primary,
                  //         // gradient: LinearGradient(colors: [
                  //         //   AppColors.primary.withAlpha(150),
                  //         //   AppColors.buttonGradient.withAlpha(150)
                  //         // ], begin: Alignment.topRight, end: Alignment.topLeft),
                  //         boxShadow: [
                  //           BoxShadow(
                  //               color: AppColors.grey.withOpacity(.2),
                  //               spreadRadius: 1,
                  //               blurRadius: 2)
                  //         ]),
                  //     child: const Center(
                  //         child: CommonText(
                  //       text: "view",
                  //       fontColor: AppColors.white,
                  //     )),
                  //   ),
                  // ),

                  // add button
                  GestureDetector(
                    onTap: updatePressed,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.only(
                          top: 5.0, bottom: 5.0, right: 15.0, left: 15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: AppColors.white,
                          gradient: const LinearGradient(colors: [
                            AppColors.primary,
                            AppColors.buttonGradient
                          ], begin: Alignment.topRight, end: Alignment.topLeft),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.grey.withOpacity(.2),
                                spreadRadius: 1,
                                blurRadius: 2)
                          ]),
                      child: const Center(
                          child: CommonText(
                        text: "update",
                        fontColor: AppColors.white,
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 5,
              child: GestureDetector(
                  onTap: deletePressed,
                  child: const Icon(
                    Icons.delete,
                    color: AppColors.grey,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
