import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/add_product_controller.dart';
import 'package:image_picker/image_picker.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black87, size: 20),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Add product",
          style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() => _buildTabIndicator()),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(() {
                switch (controller.currentStep.value) {
                  case 0:
                    return _buildBasicDetails();
                  case 1:
                    return _buildPricingUnits();
                  case 2:
                    return _buildTechnicalSpecs();
                  default:
                    return _buildBasicDetails();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTabItem("1.Basic Product Details", 0),
          _buildTabItem("2.Pricing & Units", 1),
          _buildTabItem("3.Technical", 2),
        ],
      ),
    );
  }

  Widget _buildTabItem(String label, int index) {
    bool isActive = controller.currentStep.value == index;
    return GestureDetector(
      onTap: () => controller.changeStep(index),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
          color: isActive ? const Color(0xFF1A237E) : Colors.grey[400],
          decoration: isActive ? TextDecoration.underline : null,
        ),
      ),
    );
  }

  Widget _buildBasicDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImageUploadSection(),
        const SizedBox(height: 24),
        _buildTextField("Product Code", "1234567"),
        const SizedBox(height: 16),
        _buildDropdown("Main Category", "Select the Main Category", controller.mainCategories),
        const SizedBox(height: 16),
        _buildTextField("Product Name", "Cement"),
        const SizedBox(height: 16),
        _buildDropdown("Sub-Category", "Select the Sub-Category", controller.subCategories),
        const SizedBox(height: 16),
        _buildOutOfStockSwitch(),
        const SizedBox(height: 16),
        _buildNoteField("Note", "Write a note"),
        const SizedBox(height: 16),
        _buildNoteField("Terms & Conditions", "Write a note"),
        const SizedBox(height: 32),
        _buildContinueButton(),
      ],
    );
  }

  Widget _buildPricingUnits() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pricing & Units",
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(child: _buildTextField("Ex factory price", "₹....")),
            const SizedBox(width: 16),
            Expanded(child: _buildDropdown("GST", "₹....", ["5%", "12%", "18%", "28%"])),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _buildTextField("Ex factory amount", "₹....")),
            const SizedBox(width: 16),
            Expanded(child: _buildTextField("GST Amount", "₹....")),
          ],
        ),
        const SizedBox(height: 32),
        _buildContinueButton(),
      ],
    );
  }

  Widget _buildTechnicalSpecs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Technical Specifications",
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        _buildTextField("Unit Details", "Unit of Measure"),
        const SizedBox(height: 16),
        _buildDropdown("Unit of Conversion", "Select the Unit of Conversion", ["Kg", "Ton", "Cubic Meter"]),
        const SizedBox(height: 16),
        _buildDropdown("Package Size", "Select the Package Size", ["50kg", "100kg", "Bulk"]),
        const SizedBox(height: 16),
        _buildDropdown("Package Type", "Select the Package Type", ["Bag", "Box", "Loose"]),
        const SizedBox(height: 16),
        _buildDropdown("Weight", "Select the Weight", ["Standard", "Heavy"]),
        const SizedBox(height: 16),
        _buildDropdown("Shape", "Select the Shape", ["Angular", "Rounded", "Flaky"]),
        const SizedBox(height: 16),
        _buildDropdown("Texture", "Select the Texture", ["Rough", "Smooth"]),
        const SizedBox(height: 16),
        _buildDropdown("Color", "Select the Color", ["Grey", "Yellow", "Natural"]),
        const SizedBox(height: 16),
        _buildDropdown("Grain Size", "Select the Grain Size", ["Fine", "Medium", "Coarse"]),
        const SizedBox(height: 16),
        _buildDropdown("Fineness Modulus", "Select the Fineness Modulus", ["2.2-2.6", "2.6-2.9", "2.9-3.2"]),
        const SizedBox(height: 16),
        _buildDropdown("Slit Content", "Select the Slit Content", ["Low", "Medium", "High"]),
        const SizedBox(height: 16),
        _buildDropdown("Clay & Dust Content", "Select the Clay & Dust Content", ["< 3%", "< 5%"]),
        const SizedBox(height: 16),
        _buildDropdown("Moisture Content", "Select the Moisture Content", ["Dry", "Damp", "Wet"]),
        const SizedBox(height: 16),
        _buildDropdown("Specific Gravity", "Select the Specific Gravity", ["2.5-2.7", "2.7-3.0"]),
        const SizedBox(height: 16),
        _buildDropdown("Bulk Density", "Select the Bulk Density", ["1400-1600 kg/m3", "1600-1800 kg/m3"]),
        const SizedBox(height: 16),
        _buildDropdown("Water Absorption", "Select THE Water Absorption", ["< 1%", "< 2%"]),
        const SizedBox(height: 32),
        _buildContinueButton(),
      ],
    );
  }

  Widget _buildImageUploadSection() {
    return Obx(() => SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...controller.selectedImages.asMap().entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: _buildImagePlaceholder(entry.value, entry.key),
            );
          }),
          GestureDetector(
            onTap: () => controller.pickImage(),
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: const Icon(Icons.add_circle_outline, color: Colors.black54),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _buildImagePlaceholder(XFile image, int index) {
    return Stack(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.file(File(image.path), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            onTap: () => controller.removeImage(index),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              child: const Icon(Icons.close, color: Colors.white, size: 14),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey[700])),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[400]),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey[300]!)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey[300]!)),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(String label, String hint, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey[700])),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text(hint, style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[400])),
              items: items.map((String value) {
                return DropdownMenuItem<String>(value: value, child: Text(value, style: GoogleFonts.poppins(fontSize: 12)));
              }).toList(),
              onChanged: (_) {},
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOutOfStockSwitch() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Out of Stock", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey[700])),
          Obx(() => Switch(
            value: controller.isOutOfStock.value,
            onChanged: (value) => controller.setOutOfStock(value),
            activeColor: const Color(0xFF1A237E),
          )),
        ],
      ),
    );
  }

  Widget _buildNoteField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey[700])),
        const SizedBox(height: 8),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[400]),
            contentPadding: const EdgeInsets.all(16),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey[300]!)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey[300]!)),
          ),
        ),
      ],
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (controller.currentStep.value == 2) {
            _showSuccessOverlay();
          } else {
            controller.changeStep(controller.currentStep.value + 1);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1A237E),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text("Continue", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }

  void _showSuccessOverlay() {
    Get.bottomSheet(
      Container(
        height: Get.height * 0.7,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Stack(
          children: [
            // Stylized background shapes (puzzle/abstract)
            Positioned(
              top: 40,
              left: -20,
              child: Opacity(
                opacity: 0.1,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.yellow[200],
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -30,
              right: -30,
              child: Opacity(
                opacity: 0.1,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.yellow[100],
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            // Close button
            Positioned(
              top: 20,
              right: 20,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.black54),
                onPressed: () => Get.offNamed("/ProductDetail"),
              ),
            ),
            // Content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Product added successfully",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  // Concentric success checkmark
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.yellow[50],
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.yellow[100],
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }
}
