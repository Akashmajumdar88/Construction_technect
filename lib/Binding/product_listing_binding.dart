import 'package:get/get.dart';
import '../Controller/product_listing_controller.dart';

class ProductListingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductListingController());
  }
}
