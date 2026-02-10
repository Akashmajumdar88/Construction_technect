import 'package:get/get.dart';

class ProductListingController extends GetxController {
  var selectedSort = "Sort".obs;
  var selectedRadius = "Radius".obs;
  var selectedFilter = "Filter".obs;
  
  var isNewArrivalVisible = true.obs;

  void removeNewArrival() {
    isNewArrivalVisible.value = false;
  }
}
