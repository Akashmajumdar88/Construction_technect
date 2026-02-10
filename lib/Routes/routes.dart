import 'package:get/get.dart';

class Routes {
  static Future<void> splashView() async {
    return await Get.offAllNamed("/");
  }
  static Future<void> dashboardScreen() async {
    return await Get.offAllNamed("/Dashboard");
  }
}