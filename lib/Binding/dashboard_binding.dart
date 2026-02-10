import 'package:get/get.dart';
import '../Controller/dashboard_controller.dart';
import '../Controller/home_controller.dart';


class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => HomeController());
  }
}