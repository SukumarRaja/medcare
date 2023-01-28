import 'package:flutter/material.dart';
import 'package:medcare/app/ui/widgets/common_text.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_font_size.dart';
import '../../widgets/dotted_divider.dart';

class RoomDetail extends StatelessWidget {
  const RoomDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Material(
      child: Container(
        color: AppColors.white,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Stack(
            children: [
              Container(
                height: media.height / 2.3,
                width: media.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://insights.ehotelier.com/wp-content/uploads/sites/6/2020/01/hotel-room.jpg"))),
              ),
              Positioned(
                top: media.height * 0.35,
                child: Container(
                  height: media.height,
                  width: media.width,
                  decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50))),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: 6,
                          width: 80,
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              color: AppColors.black,
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                        SizedBox(height: 15,),
                        Padding(
                          padding: EdgeInsets.only(
                              left: media.width * 0.06,
                              // top: 25,
                              right: media.width * 0.06),
                          child: Row(
                            children: [
                              CommonText(
                                text: "Executive Suit",
                                fontWeight: FontWeight.w600,
                                fontSize: AppFontSize.eighteen,
                              ),
                              Spacer(),
                              CommonText(
                                text: "\u{20B9} 350",
                                fontWeight: FontWeight.w600,
                                fontSize: AppFontSize.twentyFour,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: CommonText(
                                  text: "/night",
                                  fontColor: AppColors.black.withOpacity(.5),
                                  fontSize: AppFontSize.twelve,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                            margin: EdgeInsets.only(
                                left: media.width * 0.06,
                                right: media.width * 0.06),
                            child: DottedDivider(
                              color: AppColors.black.withOpacity(.2),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: media.height * 0.05,
                  left: media.width * 0.04,
                  child: GestureDetector(
                    onTap: () {},
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
                  )),
              Positioned(
                  top: media.height * 0.05,
                  right: media.width * 0.04,
                  child: GestureDetector(
                    onTap: () {},
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
                          Icons.favorite_border_sharp,
                          size: 22,
                          color: AppColors.black.withOpacity(.7),
                        )),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
