import 'package:get/get.dart';
import '../ui/screens/appointment/book.dart';
import '../ui/screens/home/main.dart';
import '../ui/screens/login.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: "/login",
      page: () => const Login(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: "/homeMain",
      page: () => HomeMain(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: "/bookAppointment",
      page: () => const BookAppointment(),
      transition: Transition.zoom,
    ),
  ];
}
