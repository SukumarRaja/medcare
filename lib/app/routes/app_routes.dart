import 'package:get/get.dart';
import '../ui/screens/login.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: "/login",
      page: () => const Login(),
      transition: Transition.zoom,
    )
  ];
}
