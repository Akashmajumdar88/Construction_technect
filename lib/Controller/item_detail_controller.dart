import 'package:get/get.dart';

class ItemDetailController extends GetxController {
  var selectedSidebarIndex = 0.obs;

  final List<Map<String, dynamic>> sidebarItems = [
    {"name": "Manufactured Fine Aggregate", "icon": 'assets/item1.png'},
    {"name": "Processed Fine Aggregate", "icon": 'assets/item1.png'},
    {"name": "Natural Fine Aggregate", "icon": 'assets/item1.png'},
  ];

  void changeSidebarIndex(int index) {
    selectedSidebarIndex.value = index;
  }
}
