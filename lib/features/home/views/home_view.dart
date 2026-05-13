import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_app_pro/features/home/views/tab_views/tab_comic_view.dart';
import 'package:story_app_pro/features/home/views/tab_views/tab_filter_view.dart';
import 'package:story_app_pro/features/home/views/tab_views/tab_leaderboard_view.dart';
import 'package:story_app_pro/features/home/views/tab_views/tab_novel_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // 4 Tab
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                // ==========================================
                // APPBAR 1: TÌM KIẾM & AVATAR
                // ==========================================
                SliverAppBar(
                  primary: false,
                  pinned: false,
                  floating: true,
                  snap: true,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  surfaceTintColor: Colors.transparent,
                  scrolledUnderElevation: 0,

                  toolbarHeight: 42, // Ép lùn
                  leadingWidth: 54,
                  titleSpacing: 8,

                  // Avatar
                  leading: const Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
                    child: CircleAvatar(
                      radius: 16,
                      backgroundImage: NetworkImage(
                        'https://i.pinimg.com/736x/9a/8b/fc/9a8bfcc4eb554336950585d10c120403.jpg',
                      ),
                    ),
                  ),

                  // Thanh tìm kiếm giả (Fake Search Bar)
                  title: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SizedBox(
                      height: 34,
                      child: TextField(
                        readOnly: true,
                        onTap: () {
                          Get.snackbar(
                            'Chuyển trang',
                            'Mở màn hình Tìm Kiếm riêng biệt ở đây!',
                            backgroundColor: Colors.black87,
                            colorText: Colors.white,
                          );
                        },
                        decoration: InputDecoration(
                          hintText: 'Tìm kiếm truyện...',
                          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                          prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 20),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.grey, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.grey, width: 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // ==========================================
                // APPBAR 2: THANH TABBAR CHUYỂN TRANG
                // ==========================================
                SliverAppBar(
                  primary: false,
                  pinned: true,
                  toolbarHeight: 0,
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.transparent,
                  scrolledUnderElevation: 0,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(38),
                    child: SizedBox(
                      height: 38,
                      child: TabBar(
                        // TẮT HIỆU ỨNG RIPPLE LAN TỎA
                        splashFactory: NoSplash.splashFactory,
                        splashBorderRadius: BorderRadius.circular(30),
                        overlayColor: WidgetStateProperty.resolveWith((states) {
                          if (states.contains(WidgetState.pressed)) {
                            return Colors.pink.withOpacity(0.1);
                          }
                          return Colors.transparent;
                        }),

                        padding: EdgeInsets.zero,
                        labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                        isScrollable: true,
                        tabAlignment: TabAlignment.center,
                        labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                        unselectedLabelStyle: const TextStyle(fontSize: 13),
                        labelColor: Colors.pinkAccent,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: Colors.pink,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: const [
                          Tab(text: 'Truyện tranh'),
                          Tab(text: 'Truyện chữ'),
                          Tab(text: 'BXH'),
                          Tab(text: 'Lọc nâng cao'),
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },

            // ==========================================
            // NỘI DUNG CÁC TAB
            // ==========================================
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(), // Khóa vuốt ngang
              children: [
                TabComic(),
                TabNovel(),
                TabLeaderboard(),
                TabFilter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}