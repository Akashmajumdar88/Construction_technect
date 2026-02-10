import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/materials_controller.dart';

class MaterialsView extends GetView<MaterialsController> {
  const MaterialsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Row(
                children: [
                  _buildSidebar(),
                  _buildMainContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          ),
          const CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=a042581f4e29026704d'),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Account",
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Jp nagar 7th...",
                  style: GoogleFonts.outfit(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  "Search",
                  style: GoogleFonts.outfit(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar() {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        border: Border(right: BorderSide(color: Colors.grey[100]!)),
      ),
      child: ListView.builder(
        itemCount: controller.sidebarItems.length,
        itemBuilder: (context, index) {
          return Obx(() {
            bool isSelected = controller.selectedSidebarIndex.value == index;
            return GestureDetector(
              onTap: () => controller.changeSidebarIndex(index),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  border: isSelected
                      ? const Border(left: BorderSide(color: Color(0xFF1A237E), width: 4))
                      : null,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        controller.sidebarItems[index]["icon"],
                        height: 50,width: 50,fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      controller.sidebarItems[index]["name"],
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                        fontSize: 10,
                        color: isSelected ? const Color(0xFF1A237E) : Colors.black45,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }

  Widget _buildMainContent() {
    return Expanded(
      child: Obx(() {
        String title = controller.sidebarItems[controller.selectedSidebarIndex.value]["name"];
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Manufacture $title",
                style: GoogleFonts.outfit(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed("/ItemDetail"),
                    child: _buildSubCategory("Manufacture fine aggregate"),
                  ),
                  _buildSubCategory("Processed fine aggregate"),
                  _buildSubCategory("Natural fine aggregate"),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildSubCategory(String name) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Center(
            child: Image.asset(
              'assets/item1.png',
              height: 50,
              width: 50,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 80,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(fontSize: 10, color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
