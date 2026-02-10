import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedCategoryIndex = 0.obs;

  void changeCategoryIndex(int index) {
    selectedCategoryIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
