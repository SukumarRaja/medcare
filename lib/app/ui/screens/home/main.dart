import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/main.dart';
import '../../themes/app_colors.dart';
import 'home.dart';

class HomeMain extends StatelessWidget {
  HomeMain({Key? key}) : super(key: key);
  final List<Widget> pages = [
    Container(
      child: Center(
        child: Text("profile"),
      ),
    ),
    Container(
      child: Center(
        child: Text("nofications"),
      ),
    ),
    Home(),
    Container(
      child: Center(
        child: Text("schedule"),
      ),
    ),
    Container(
      child: Center(
        child: Text("History"),
      ),
    ),
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
          selectedItemColor: AppColors.primary,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          selectedLabelStyle: const TextStyle(fontFamily: "Oswald"),
          selectedIconTheme: const IconThemeData(color: AppColors.primary),
          unselectedIconTheme: const IconThemeData(color: AppColors.grey),
          onTap: (data) {
            MainController.to.pageIndex = data;
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "Notifications"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.schedule), label: "Schedule"),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: "History"),
          ],
        ),
      ),
      body: Obx(() => pages[MainController.to.pageIndex]),
    );
  }
}
