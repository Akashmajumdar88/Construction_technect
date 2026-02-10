import 'package:get/get.dart';
import '../Controller/item_detail_controller.dart';

class ItemDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ItemDetailController());
  }
}
