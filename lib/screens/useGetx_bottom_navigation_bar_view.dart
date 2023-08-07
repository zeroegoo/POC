// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../controller/get.dart';
// import 'Page3.dart';
// import 'Page2.dart';
// import 'Page1.dart';
// import 'Page4.dart';
//
//
// class BottomNavigationBarExample extends StatelessWidget {
//   final controller = Get.put(BottomNavigationBarController());
//
//   static List<Widget> _pages = <Widget>[
//     Page1_View(),
//     Page2_View(),
//     Page3_View(),
//     Page4_View(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('BottomNavigationBar Sample'),
//       // ),
//         body: Obx(() {
//           return IndexedStack(
//             index: controller.selectedIndex,
//             children: _pages,
//           );
//         }),
//         bottomNavigationBar: Obx(
//               () =>
//               SizedBox(
//                 height: Get.height * 0.07,
//                 child: BottomNavigationBar(
//                   elevation: 2,
//                   items: const <BottomNavigationBarItem>[
//                     BottomNavigationBarItem(
//                       icon: Icon(Icons.home_filled),
//                       label: 'หน้าแรก',
//                     ),
//                     BottomNavigationBarItem(
//                       icon: Icon(Icons.list_rounded),
//                       label: 'การทำรายการ',
//                     ),
//                     BottomNavigationBarItem(
//                       icon: Icon(Icons.add_alert_outlined),
//                       label: 'แจ้งเตือน',
//                     ),
//                     BottomNavigationBarItem(
//                       icon: Icon(Icons.person_2_rounded),
//                       label: 'โปรไฟล์',
//                     ),
//                   ],
//                   currentIndex: controller.selectedIndex,
//                   selectedItemColor: Colors.purple,
//                   unselectedItemColor: Colors.black26,
//                   onTap: controller.onItemTapped,
//                   showUnselectedLabels: true,
//                 ),
//               ),
//         ));
//   }
// }
