import 'package:employee_app/constans/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart' as badges;

import '../controller/get.dart';
import '../main.dart';
import 'Page3.dart';
import 'Page2.dart';
import 'Page1.dart';
import 'Page4.dart';


final selectedIndex_ = StateProvider((ref) => 0);

class BottomNavigationBarExample extends ConsumerWidget {
  const BottomNavigationBarExample({super.key});

  static final List<Widget> _pages = [
    Page1(),
    Page2(),
    Page3(),
    Page4(),
  ];



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedIndex = ref.watch(selectedIndex_);
    var notificationCount = ref.watch(notificationCountProvider);

    return Scaffold(
        // appBar: AppBar(
        //   title: Text('BottomNavigationBar Sample'),
        // ),

        body: IndexedStack(
          index: selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: SizedBox(
            height: 60.h,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: selectedIndex,
              selectedItemColor: primaryColor,
              unselectedItemColor: Colors.black26,
              onTap: (index) {
                ref.read(selectedIndex_.notifier).state = index;
              },
              showUnselectedLabels: true,
              elevation: 2,
              items: <BottomNavigationBarItem>[
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: 'หน้าแรก',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.list_rounded),
                  label: 'การทำรายการ',
                ),
                BottomNavigationBarItem(
                  icon: Stack(
                    children: [
                      const Icon(Icons.add_alert_outlined),
                      if (notificationCount > 0)
                        Positioned(
                          right: 0,
                          child: badges.Badge(
                            badgeContent: Text(
                              notificationCount.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            badgeStyle: const badges.BadgeStyle(badgeColor: Colors.red),
                            child: const Icon(Icons.add_alert_outlined),

                          ),
                        ),
                    ],
                  ),
                  label: 'แจ้งเตือน',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_rounded),
                  label: 'โปรไฟล์',
                ),
              ],
            ),
          ),
        );
  }
}
