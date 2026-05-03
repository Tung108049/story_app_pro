import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_app_pro/controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // 4 tab
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
          () => IndexedStack(
            index: controller.currentBottomTab.value,
            children: [
              NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      pinned: true,
                      floating: true,
                      // Vuốt xuống là AppBar hiện ra ngay
                      snap: true,
                      backgroundColor: Colors.white,
                      elevation: 0,

                      //Góc trái
                      leading: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://i.pinimg.com/736x/9a/8b/fc/9a8bfcc4eb554336950585d10c120403.jpg',
                          ),
                        ),
                      ),

                      //Giữa
                      title: SizedBox(
                        height: 34,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          // chỉnh con trỏ
                          cursorHeight: 16,
                          cursorColor: Colors.pinkAccent,

                          decoration: InputDecoration(
                            hintText: 'Tìm kiếm truyện...',
                            hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 13,
                            ),

                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey.shade300,
                            ),

                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.pinkAccent,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),

                      //Góc dưới Tab Bar
                      bottom: const TabBar(
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        labelColor: Colors.pinkAccent,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: Colors.pinkAccent,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: [
                          Tab(text: 'Đề cử'),
                          Tab(text: 'Mới cập nhật'),
                          Tab(text: 'BXH'),
                          Tab(text: 'Thể loại'),
                        ],
                      ),
                    ),
                  ];
                },

                body: TabBarView(
                  children: [
                    Center(child: Text('Đề cử')),
                    GridView.builder(
                      padding: EdgeInsets.all(12),
                      physics: const ClampingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.6,
                      ),

                      itemBuilder: (context, index) {
                        final story =
                            controller.dsTruyenDeCu[index %
                                controller.dsTruyenDeCu.length];

                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),

                          //ClipRRect bo tròn toàn bộ cấu trúc bên trong
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  // ép khối ảnh chiếm hết khoảng trống phía trên
                                  child: Stack(
                                    children: [
                                      // Lớp dưới cùng: Ảnh bìa
                                      Positioned.fill(
                                        child: Image.network(
                                          story.coverImageUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),

                                      // Lớp nổi lên: Tem giá đè ở góc trên bên phải
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            // Nếu isPaid = 1 (Tốn tiền) thì tô màu Hồng, Free thì tô Xanh
                                            color: story.isPaid == 1
                                                ? Colors.pinkAccent
                                                : Colors.greenAccent,
                                            // Bo tròn góc dưới bên trái của cái tem
                                            borderRadius:
                                                const BorderRadius.only(
                                                  bottomLeft: Radius.circular(
                                                    8,
                                                  ),
                                                ),
                                          ),
                                          child: Text(
                                            story.isPaid == 1
                                                ? 'Trả phí'
                                                : 'Miễn phí',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Tên truyện
                                      Text(
                                        story.title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                      const SizedBox(height: 4),

                                      // Chương mới nhất (Dữ liệu giả)
                                      Text(
                                        'Chương 128: Quyết Chiến',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.pinkAccent.shade400,
                                          fontSize: 11,
                                        ),
                                      ),
                                      const SizedBox(height: 4),

                                      // Dòng: Lượt xem -> Đánh giá
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.remove_red_eye,
                                            size: 12,
                                            color: Colors.grey.shade500,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            '${(story.viewsCount / 1000).toStringAsFixed(1)}k',
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 10,
                                            ),
                                          ),
                                          const Spacer(),
                                          // Đẩy đánh giá dạt sang tít mép phải
                                          Icon(
                                            Icons.star,
                                            size: 12,
                                            color: Colors.orange.shade400,
                                          ),
                                          const SizedBox(width: 2),
                                          Text(
                                            story.averageRating.toString(),
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),

                                      // Thể loại (Dữ liệu giả)
                                      Text(
                                        'Thể loại: Ngôn tình, Chuyển sinh',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontSize: 10,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Center(child: Text('BXH')),
                    Center(child: Text('Thể loại')),
                  ],
                ),
              ),
              Container(
                color: Colors.blue.shade50,
                child: const Center(
                  child: Text(
                    'Giao diện Tủ Sách',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),

              // PHÒNG SỐ 2: NÚT DẤU CỘNG (Để trống vì mình popup thông báo chứ không chuyển trang)
              const SizedBox(),

              // PHÒNG SỐ 3: KHÁM PHÁ
              Container(
                color: Colors.green.shade50,
                child: const Center(
                  child: Text(
                    'Giao diện Khám Phá',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),

              // PHÒNG SỐ 4: TÀI KHOẢN
              Container(
                color: Colors.orange.shade50,
                child: const Center(
                  child: Text(
                    'Giao diện Tài Khoản',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ],
          ),
        ),
        // 1. QUÊN BỌC Obx ĐỂ NÓ TỰ CẬP NHẬT GIAO DIỆN NÈ
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.pinkAccent,
            unselectedItemColor: Colors.grey,

            // 2. THIẾU 2 DÒNG NỐI DÂY THẦN KINH NÀY NÊN BẤM NÓ KHÔNG NHẬN
            currentIndex: controller.currentBottomTab.value,
            onTap: (index) => controller.changeBottomTab(index),

            items: const [
              // Tiện tay thêm chữ const vào đây cho nó tối ưu hiệu năng
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Trang chủ',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_outlined),
                activeIcon: Icon(Icons.menu_book),
                label: 'Tủ sách',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_box, color: Colors.pinkAccent, size: 38),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined),
                activeIcon: Icon(Icons.explore),
                label: 'Khám phá',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: 'Tài khoản',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
