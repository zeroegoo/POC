import 'package:depertment_of_labor_employers/features/notification/presentation/widgets/notificationitem.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Item 1',
      'Item 2',
      'Item 1',
      'Item 2',
      'Item 1',
      'Item 2',
      'Item 1',
      'Item 2',
      'Item 1',
      'Item 2',
      'Item 1',
      'Item 2',
      'Item 1',
      'Item 2',

      // Add more items as needed
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text('การแจ้งเตือน'),
          elevation: 1,
          shadowColor: Colors.black,
          automaticallyImplyLeading: false,
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            if (index >= 2) {
              return const Column(
                children: <Widget>[
                  NotificationsItem(isnews: false),
                  Divider(
                    color: Colors.grey, // Set the color of the divider line
                    thickness: 1.0,
                    height: 1, // Set the thickness of the divider line
                  ),
                ],
              );
            } else {
              return const Column(
                children: <Widget>[
                  NotificationsItem(isnews: true),
                  Divider(
                    color: Colors.grey, // Set the color of the divider line
                    thickness: 1.0,
                    height: 1, // Set the thickness of the divider line
                  ),
                ],
              );
            }
          },
        ));
  }
}
