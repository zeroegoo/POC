import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constans/constans.dart';
import '../controller/get.dart';
import '../main.dart';
import '../widgets/custom_appbar.dart';
import 'bottom_navigation_bar_view.dart';

class Page2 extends ConsumerWidget {
  // final controller = Get.put(BottomNavigationBarController());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationCount = ref.watch(notificationCountProvider);
    return  Scaffold(
      body: Column(
        children: [
          appbar(
            title: 'ยื่นคำขอใบอนุญาต',
            icon: Icons.arrow_back_ios_rounded,
          ),

        ],
      ),
    );
  }
}
