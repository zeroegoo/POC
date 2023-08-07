import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constans/constans.dart';
import '../main.dart';
import '../widgets/custom_appbar.dart';

class Page3 extends ConsumerWidget {
  final List<ListItem> items = [
    ListItem(
      title: 'Item 1',
      day: 'Monday',
      message: 'This is message for item 1.',
    ),
    ListItem(
      title: 'Item 2',
      day: 'Tuesday',
      message: 'This is message for item 2.',
    ),
    ListItem(
      title: 'Item 3',
      day: 'Wednesday',
      message: 'This is message for item 3.',
    ),
    // เพิ่มรายการเพิ่มเติมตามต้องการ
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationCount = ref.watch(notificationCountProvider);
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('BottomNavigationBar Sample'),
        // ),
        body: Column(
      children: [
        appbar(
          title: "การแจ้งเตือน",
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              width: 1.sw,
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Column(
                children: [
                  Center(
                    child: InkWell(
                      onTap: () {
                        ref.read(notificationCountProvider.notifier).state++;
                      },
                      child: Text(
                        "+ noti",
                        style: optionStyle(30),
                      ),
                    ),
                  ),Center(
                    child: InkWell(
                      onTap: () {
                        ref.read(notificationCountProvider.notifier).state--;
                      },
                      child: Text(
                        "- noti",
                        style: optionStyle(30),
                      ),
                    ),
                  ),
                  // ListView.builder(
                  //   itemCount: items.length,
                  //   itemBuilder: (context, index) {
                  //     return ListTile(
                  //       title: Text(items[index].title),
                  //       subtitle: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text('Day: ${items[index].day}'),
                  //           Text('Message: ${items[index].message}'),
                  //         ],
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

class ListItem {
  final String title;
  final String day;
  final String message;

  ListItem({
    required this.title,
    required this.day,
    required this.message,
  });
}
