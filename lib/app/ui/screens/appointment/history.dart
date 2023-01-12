import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import '../../../controller/appointment.dart';
import '../../themes/app_colors.dart';
import '../../widgets/appointment/appointments_card.dart';
import '../../widgets/appointment/history_card.dart';

class AppointmentsHistory extends StatelessWidget {
  const AppointmentsHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 50,
              margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
              width: media.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.grey.withOpacity(.2),
                      blurRadius: 1,
                      spreadRadius: 1,
                      offset: const Offset(0.1, 0.3))
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: "search",
                          prefixIcon: Icon(Icons.search)),
                    ),
                  ),
                  SizedBox(
                    width: media.width * 0.3,
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.menu),
                  ),
                ],
              ),
            ),
            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, int index) {
                  return AppointmentsHistoryCard(
                    doctorName: "Srena Gome",
                    specialist: "Stomach Pain",
                    date: "10/01/2023",
                    time: "01:20 am",
                    status: "Booked",
                    slots: "5",
                    image:
                        "https://www.dragarwal.com/wp-content/uploads/2022/02/eye-doctor-popup.png",
                    onPressed: () {},
                  );
                }),
          ],
        ),
      )),
    );
  }
}
