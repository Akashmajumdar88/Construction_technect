import 'package:get/get.dart';
import '../Controller/materials_controller.dart';

class MaterialsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MaterialsController());
  }
}
