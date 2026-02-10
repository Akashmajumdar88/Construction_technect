import 'package:get/get.dart';
import '../Controller/add_product_controller.dart';

class AddProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddProductController());
  }
}
