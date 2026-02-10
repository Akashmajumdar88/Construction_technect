import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProductController extends GetxController {
  var currentStep = 0.obs;
  var productCode = "".obs;
  var productName = "".obs;
  var selectedMainCategory = RxnString();
  var selectedSubCategory = RxnString();
  var isOutOfStock = false.obs;
  var note = "".obs;
  var terms = "".obs;

  var selectedImages = <XFile>[].obs;
  final ImagePicker _picker = ImagePicker();

  final List<String> mainCategories = ["Aggregate", "Cement", "Steel", "Concrete"];
  final List<String> subCategories = ["Manufacture Sand", "Natural Sand", "Processed Sand"];

  Future<void> pickImage() async {
    final List<XFile> images = await _picker.pickMultiImage();
    if (images.isNotEmpty) {
      selectedImages.addAll(images);
    }
  }

  void removeImage(int index) {
    selectedImages.removeAt(index);
  }

  void changeStep(int step) {
    currentStep.value = step;
  }

  void setOutOfStock(bool value) {
    isOutOfStock.value = value;
  }
}
