import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/main.dart';
import '../../themes/app_colors.dart';
import '../appointment/appointments.dart';
import '../appointment/history.dart';
import '../appointment/new bookings.dart';
import '../notifications.dart';
import '../profile/profile.dart';
import 'home.dart';

class HomeMain extends StatelessWidget {
  HomeMain({Key? key}) : super(key: key);
  final List<Widget> pages = [
    const Profile(),
    const BookNewAppointments(),
    const Home(),
    const Appointments(),
    const AppointmentsHistory()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: MainController.to.pageIndex,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: AppColors.grey,
          elevation: 25,
          selectedItemColor: AppColors.green,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          selectedLabelStyle: const TextStyle(fontFamily: "Oswald"),
          selectedIconTheme: const IconThemeData(color: AppColors.green),
          unselectedIconTheme: const IconThemeData(color: AppColors.grey),
          onTap: (data) {
            MainController.to.pageIndex = data;
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: "Book new"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.timer), label: "Appointments"),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: "History"),
          ],
        ),
      ),
      body: Obx(() => pages[MainController.to.pageIndex]),
    );
  }
}
