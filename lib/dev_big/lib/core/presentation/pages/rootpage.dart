import 'dart:async';

import 'package:depertment_of_labor_employers/core/presentation/pages/mainpage.dart';
import 'package:depertment_of_labor_employers/core/presentation/widgets/gridbody.dart';
import 'package:depertment_of_labor_employers/core/presentation/widgets/newsslide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../features/notification/presentation/pages/notification.dart';
import '../../../test.dart';

class Index extends StateNotifier<int> {
  Index() : super(0);
  set value(int index) => state = index;
}

final indexProvider = StateNotifierProvider((ref) => Index());

class RootPage extends ConsumerWidget {
  static const route = '/home';
  RootPage({Key? key}) : super(key: key);

  final List<Widget> fragments = [
    const MainPage(),
    FourthTab(),
    NotificationsPage(),
    NewsSlides()
  ];

  final List<BottomNavigationBarItem> navItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าแรก'),
    BottomNavigationBarItem(icon: Icon(Icons.list), label: 'การทำรายการ'),
    BottomNavigationBarItem(
        icon: Icon(Icons.notifications), label: 'การทำแจ้งเตือน'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'โปรไฟล์'),
  ];

  final Text title = const Text('My App');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController controller = PageController();
    final int menuIndex = ref.watch(indexProvider) as int;
    return Scaffold(
      body: IndexedStack(
        index: menuIndex,
        children: fragments,
      ),
      // body: PageView(
      //     physics: const NeverScrollableScrollPhysics(),
      //     controller: controller,
      //     children: fragments,
      //     onPageChanged: (i) => ref.read(indexProvider.notifier).value = i),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color.fromRGBO(
              121, 30, 195, 1), // Selected item color (active item)
          unselectedItemColor: Colors.grey,
          items: [
            for (var i = 0; i < navItems.length; i++)
              i == 2 // Check for the "Notifications" tab (index 2)
                  ? BottomNavigationBarItem(
                      icon: Badge(
                        label: const Text(
                          "2",
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,

                        // Customize the badge background color
                        child: navItems[i].icon!,
                      ),
                      label: navItems[i].label!,
                    )
                  : navItems[i],
          ],
          showUnselectedLabels: true,
          currentIndex: menuIndex,
          onTap: (i) {
            ref.read(indexProvider.notifier).value = i;
            // controller.animateToPage(i,
            //     duration: const Duration(seconds: 1), curve: Curves.easeInOut);
          }),
    );
  }
}

class NotificationsPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Search Tab'),
    );
  }
}

class FourthTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Tab'),
    );
  }
}
