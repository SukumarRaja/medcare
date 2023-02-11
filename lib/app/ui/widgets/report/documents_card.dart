import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../common_text.dart';

class DocumentsCard extends StatelessWidget {
  const DocumentsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 150,
              width: media.width,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.grey.withOpacity(.2),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0.2, 0.3))
                  ],
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://www.coats.com/-/media/Coats/End-Use/Personal-Protection/PPE/Surgeon.jpg?rev=4d55fa2cb9a84418b8bfccaa3e34164f&width=600&height=460&op=crop"))),
            ),
            Positioned(
              bottom: 15,
              right: 20,
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: AppColors.primary,
                      gradient: const LinearGradient(
                          colors: [AppColors.primary, AppColors.buttonGradient],
                          begin: Alignment.topRight,
                          end: Alignment.topLeft),
                    ),
                    child: Icon(
                      Icons.download,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(
                    width: media.width * 0.04,
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: AppColors.primary,
                      gradient: const LinearGradient(
                          colors: [AppColors.red, AppColors.red],
                          begin: Alignment.topRight,
                          end: Alignment.topLeft),
                    ),
                    child: Icon(
                      Icons.delete,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        CommonText(text: "Operation Report")
      ],
    );
  }
}
