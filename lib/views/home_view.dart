import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_app_pro/controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({
    super.key,
  });

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // App truyện có 4 tab
      child: Scaffold(
        backgroundColor: Colors.white,

        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true, // Vuốt nhẹ xuống là AppBar hiện ra ngay
                snap: true,     // Bật ra trọn vẹn luôn
                backgroundColor: Colors.white,
                elevation: 0,

                //Góc trái
                leading: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                      backgroundImage: NetworkImage('https://i.pinimg.com/736x/9a/8b/fc/9a8bfcc4eb554336950585d10c120403.jpg')
                  ),
                ),

                //Giữa
                title: SizedBox(
                  height: 34,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    // chỉnh con trỏ
                    cursorHeight: 14,
                    cursorColor: Colors.pinkAccent,

                    decoration: InputDecoration(
                      hintText: 'Tìm kiếm truyện...',
                      hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),

                      prefixIcon: Icon(Icons.search, color: Colors.grey.shade300),

                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.grey, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.pinkAccent, width: 1.5),
                      ),

                    ),
                  ),
                ),

                //Góc phải
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.history, color: Colors.pinkAccent)),
                  const SizedBox(width: 4),
                ],

                //Góc dưới
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


          body: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 50,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.book, color: Colors.grey),
                title: Text('Truyện siêu hay số $index'),
                subtitle: const Text('Cập nhật 5 phút trước'),
              );
            },
          ),
        ),



        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.pinkAccent,
          unselectedItemColor: Colors.grey,

          items: [
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
              icon: Icon(Icons.add_box, color: Colors.pinkAccent, size: 38,),
              label: 'Đăng truyện',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              activeIcon: Icon(Icons.explore),
              label: 'Khám phá',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Tài khoản'
            ),
          ],
        ),
      ),
    );
  }
}
