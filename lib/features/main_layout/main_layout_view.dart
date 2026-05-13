import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/views/home_view.dart';
import 'main_layout_controller.dart';

class MainLayoutView extends StatelessWidget {
  MainLayoutView({super.key});

  // Tiêm Controller vào View
  final MainLayoutController controller = Get.put(MainLayoutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Dùng IndexedStack để giữ nguyên trạng thái màn hình khi chuyển Tab
      body: Obx(
        () => IndexedStack(
          index: controller.currentTab.value,
          children: [
            const HomeView(),

            // Phòng 1: Chỗ này mốt sẽ gọi màn hình CommunityView()
            Container(
              color: Colors.blue.shade50,
              child: const Center(child: Text('Màn hình Cộng đồng')),
            ),

            // Phòng 2: Để trống vì làm nút nổi
            const SizedBox(),

            // Phòng 3: Chỗ này mốt sẽ gọi BookshelfView()
            Container(
              color: Colors.green.shade50,
              child: const Center(child: Text('Màn hình Tủ sách')),
            ),

            // Phòng 4: Chỗ này mốt sẽ gọi ProfileView()
            Container(
              color: Colors.orange.shade50,
              child: const Center(child: Text('Màn hình Tài Khoản')),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        // Tổng chiều cao = 56px (thanh lùn) + Khoảng trống vạch vuốt hệ thống
        height: 54 + MediaQuery.of(context).padding.bottom,
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        decoration: BoxDecoration(
          color: Colors.white,
          // Thêm cái bóng mờ nhẹ ở trên cho nó tách biệt với nội dung
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -4),
            )
          ],
        ),

        // Obx bọc ngoài Row để tự động đổi màu icon khi chuyển Tab
        child: Obx(
              () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Tab 0: Home
              _buildNavItem(Icons.home_outlined, Icons.home, 'Trang chủ', 0, controller),

              // Tab 1: Cộng đồng (Quả địa cầu)
              _buildNavItem(Icons.public_outlined, Icons.public, 'Cộng đồng', 1, controller),

              // Nút Thêm Truyện ở giữa (Giữ nguyên)
              GestureDetector(
                onTap: () => controller.changeTab(2),
                child: const SizedBox(
                  width: 56,
                  height: 56,
                  child: Icon(Icons.add_box, color: Colors.pinkAccent, size: 36),
                ),
              ),

              // Tab 3: Tủ sách
              _buildNavItem(Icons.menu_book_outlined, Icons.menu_book, 'Tủ sách', 3, controller),

              // Tab 4: Tài khoản
              _buildNavItem(Icons.person_outline, Icons.person, 'Tài khoản', 4, controller),
            ],
          ),
        ),
      ),
    );
  } // Kết thúc hàm build()

  // ==========================================
  // HÀM HELPER: Tự động vẽ Nút bấm (Viết ngay dưới hàm build)
  // ==========================================
  // ==========================================
  // HÀM HELPER: Tự động vẽ Nút bấm có chữ
  // ==========================================
  Widget _buildNavItem(IconData outlineIcon, IconData solidIcon, String label, int index, MainLayoutController controller) {
    bool isSelected = controller.currentTab.value == index;

    return GestureDetector(
      behavior: HitTestBehavior.opaque, // Bấm viền trống vẫn nhận lệnh
      onTap: () => controller.changeTab(index),
      child: SizedBox(
        width: 60, // Nới rộng ra một tí để chữ không bị rớt dòng
        height: 56,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Canh giữa dọc
          children: [
            Icon(
              isSelected ? solidIcon : outlineIcon,
              color: isSelected ? Colors.pinkAccent : Colors.grey,
              size: 22, // Bóp icon nhỏ lại 1 chút (từ 24 xuống 22) nhường chỗ cho chữ
            ),
            const SizedBox(height: 2), // Khoảng cách bé tí giữa Icon và Chữ
            Text(
              label,
              style: TextStyle(
                fontSize: 10, // Chữ bé xíu lùn lùn cho sang
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.pinkAccent : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}