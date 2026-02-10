import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/dashboard_controller.dart';
import 'home_view.dart';

class Dashboard extends GetView<DashboardController> {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => IndexedStack(
            index: controller.selectedIndex.value,
            children: const [
              HomeView(),
              Center(child: Text("Grid Page")),
              Center(child: Text("Add Page")),
              Center(child: Text("Extension Page")),
              Center(child: Text("Menu Page")),
            ],
          )),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Icon Bar
            Container(
              height: 70,
              margin: const EdgeInsets.only(right: 80),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFBE6), // Light cream color
                borderRadius: BorderRadius.circular(35),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(0, Icons.house_rounded),
                  _buildNavItem(1, Icons.grid_view_rounded),
                  _buildNavItem(2, Icons.add_circle_outline_rounded),
                  _buildNavItem(3, Icons.extension_rounded),
                  _buildNavItem(4, Icons.menu_rounded),
                ],
              ),
            ),
            // Merchant Button
            Positioned(
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: () => Get.toNamed("/AddProduct"),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A237E), // Dark blue
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.cached_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Merchant",
                        style: GoogleFonts.outfit(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon) {
    return Obx(() {
      bool isSelected = controller.selectedIndex.value == index;
      return IconButton(
        onPressed: () => controller.changeTabIndex(index),
        icon: Icon(
          icon,
          color: isSelected ? const Color(0xFF1A237E) : Colors.black45,
          size: 28,
        ),
      );
    });
  }
}
