import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageHeader(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProductHeader(),
                  const SizedBox(height: 16),
                  _buildPriceSection(),
                  const SizedBox(height: 16),
                  _buildQuantityAndLocation(),
                  const SizedBox(height: 24),
                  _buildSpecTable("Product Specification", [
                    ["Brand Name", "Birla cement"],
                    ["Category", "Birla cement"],
                    ["Sub category", "Birla cement"],
                    ["Stock Quantity", "Birla cement"],
                  ]),
                  const SizedBox(height: 24),
                  _buildSpecTable("Technical Specification", [
                    ["Package Type", "Birla cement"],
                    ["Package Size", "Birla cement"],
                    ["Shape", "Birla cement"],
                    ["Texture", "Birla cement"],
                    ["Colour", "Birla cement"],
                    ["Size", "Birla cement"],
                    ["Weight", "Birla cement"],
                    ["Fineness Modulus", "Birla cement"],
                    ["Specific Gravity", "Birla cement"],
                    ["Bulk Density", "Birla cement"],
                    ["Water Absorption", "Birla cement"],
                    ["Moisture Content", "Birla cement"],
                    ["Clay & Dust Content", "Birla cement"],
                    ["Silt Content", "Birla cement"],
                  ]),
                  const SizedBox(height: 24),
                  _buildTermsSection(),
                  const SizedBox(height: 24),
                  _buildReviewsSection(),
                  const SizedBox(height: 24),
                  _buildExploreSection(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildImageHeader() {
    return Stack(
      children: [
        Image.asset(
          'assets/item1.png',
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white54,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black87, size: 20),
                    onPressed: () => Get.back(),
                  ),
                ),
                Row(
                  children: [
                    _buildTopIcon(Icons.share_outlined),
                    const SizedBox(width: 8),
                    _buildTopIcon(Icons.favorite_border_rounded),
                    const SizedBox(width: 8),
                    _buildTopIcon(Icons.more_horiz_rounded),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: const Icon(Icons.favorite, color: Colors.blueGrey, size: 20),
          ),
        ),
      ],
    );
  }

  Widget _buildTopIcon(IconData icon) {
    return CircleAvatar(
      backgroundColor: Colors.white54,
      child: Icon(icon, color: Colors.black87, size: 20),
    );
  }

  Widget _buildProductHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 12,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=a042581f4e29026704d'),
                ),
                const SizedBox(width: 8),
                Text(
                  "Manufacture sand",
                  style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(color: const Color(0xFF1A237E), borderRadius: BorderRadius.circular(4)),
                  child: const Text("CONNECTED", style: TextStyle(color: Colors.white, fontSize: 8)),
                ),
              ],
            ),
            Text(
              "Ramchandra pvt.Ltd",
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
            ),
            Text(
              "GSTIN : 12ABCDE1234F1Z5",
              style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey[400]),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(4)),
              child: Row(
                children: const [
                  Icon(Icons.star, color: Colors.white, size: 12),
                  SizedBox(width: 2),
                  Text("0.0", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Text("0 LAKH", style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey)),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceSection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.amber[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("₹ 4,200/unit", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 14)),
              Text("Ex factory price", style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("₹ 000 (500)", style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
              Text("GST", style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey)),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("₹ 0,000", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 14)),
              Text("Ex Factory Amount", style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityAndLocation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(color: const Color(0xFF1A237E), borderRadius: BorderRadius.circular(4)),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => controller.decrement(),
                    icon: const Icon(Icons.remove, color: Colors.white, size: 16),
                  ),
                  Obx(() => Text("${controller.quantity}", style: const TextStyle(color: Colors.white))),
                  IconButton(
                    onPressed: () => controller.increment(),
                    icon: const Icon(Icons.add, color: Colors.white, size: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text("Delivery address", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600)),
        const SizedBox(height: 4),
        Text(
          "Address: 2MT+54 Mumbai, Maharashtra, Ramchandra pvt.Ltd",
          style: GoogleFonts.poppins(fontSize: 12, color: Colors.black87),
        ),
        const SizedBox(height: 8),
        Text("Manufacturing unit", style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey)),
        Text("Near by 32.0Km", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600)),
        TextButton(
          onPressed: () {},
          child: const Text("+ Add", style: TextStyle(color: Color(0xFF1A237E))),
        ),
      ],
    );
  }

  Widget _buildSpecTable(String title, List<List<String>> rows) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.grey[200]!)),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.indigo[50],
                child: Row(
                  children: [
                    Expanded(child: Text("Specification", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 12))),
                  ],
                ),
              ),
              ...rows.map((row) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey[200]!))),
                child: Row(
                  children: [
                    Expanded(child: Text(row[0], style: GoogleFonts.poppins(color: Colors.black87, fontSize: 12))),
                    Text(row[1], style: GoogleFonts.poppins(color: Colors.black54, fontSize: 12)),
                  ],
                ),
              )).toList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTermsSection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.amber[50], borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Terms", style: TextStyle(fontSize: 10, color: Colors.grey)),
          Text("Name of person here", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          const Text("Terms and conditions", style: TextStyle(fontSize: 10, color: Colors.grey)),
          Text("Terms and condition will be added here", style: GoogleFonts.poppins(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildReviewsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Ratings and reviews", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.help_outline, size: 16),
              label: const Text("Ask question", style: TextStyle(fontSize: 10)),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildReviewItem(),
        const SizedBox(height: 24),
        _buildReviewItem(),
        const SizedBox(height: 24),
        _buildReviewItem(),
      ],
    );
  }

  Widget _buildReviewItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("4.5", style: GoogleFonts.poppins(color: Colors.green, fontWeight: FontWeight.bold)),
            const SizedBox(width: 4),
            Row(children: List.generate(5, (_) => const Icon(Icons.star, color: Colors.green, size: 12))),
            const SizedBox(width: 8),
            const Text("a week ago", style: TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const CircleAvatar(radius: 12, backgroundColor: Colors.grey),
            const SizedBox(width: 8),
            Text("Ramappa", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600)),
          ],
        ),
        const Text("Manchonghele maths bpdna", style: TextStyle(fontSize: 10, color: Colors.grey)),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _buildReviewImage()),
            const SizedBox(width: 4),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: _buildReviewImage()),
                      const SizedBox(width: 4),
                      Expanded(child: _buildReviewImage()),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(child: _buildReviewImage()),
                      const SizedBox(width: 4),
                      Expanded(child: _buildReviewImage()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildReviewImage() {
    return Container(
      height: 60,
      decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(4)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.asset('assets/item1.png', fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildExploreSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Explore our other product", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
            const Icon(Icons.arrow_forward_ios_rounded, size: 16),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildRelatedItem("Concrete"),
            _buildRelatedItem("Cement"),
            _buildRelatedItem("Steel"),
          ],
        ),
      ],
    );
  }

  Widget _buildRelatedItem(String name) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
          child: Center(child: Image.asset('assets/item1.png', height: 50)),
        ),
        const SizedBox(height: 4),
        Text(name, style: GoogleFonts.poppins(fontSize: 10)),
      ],
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Explore More:", style: TextStyle(fontSize: 10, color: Colors.grey)),
                Text("View Categories >", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A237E),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text("Connect", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
