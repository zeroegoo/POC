import 'package:depertment_of_labor_employers/core/presentation/pages/errorpage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../features/addemployee/presentation/pages/rootemployee.dart';
import '../../../features/deleteemployee/presentation/pages/del_searchemployee.dart';

class MyGridView extends StatelessWidget {
  final List<IconData> icons = [
    Icons.mail_outline,
    Icons.person_add_alt_1,
    Icons.person_remove_alt_1,
    Icons.alarm_add,
    Icons.people_alt,
    Icons.more_horiz,
  ];

  final List<String> labels = [
    'ขอใบอนุญาต',
    'แจ้งเข้าทำงาน',
    'แจ้งออกจากงาน',
    'ขอใบต่ออายุ',
    'รวมลูกจ้าง',
    'อื่นๆ',
  ];

  final List<Widget> pages = [
    RootEmployeePage(),
    RootEmployeePage(),
    RootEmployeePage(),
    RootEmployeePage(),
    RootEmployeePage(),
    RootEmployeePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap:
              true, // Allow the GridView to take only the required space
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of columns in the grid
            crossAxisSpacing: 0.w, // Spacing between columns
            mainAxisSpacing: 0.h,
            childAspectRatio: 1.1, // Spacing between rows
          ),
          itemCount: icons.length,
          itemBuilder: (context, index) {
            return GridItem(
              iconData: icons[index],
              label: labels[index],
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final IconData iconData;
  final String label;
  final int index;

  GridItem({required this.iconData, required this.label, required this.index});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      ErrorPage(),
      RootEmployeePage(),
      DeleteEmployeeSearch(),
      ErrorPage(),
      ErrorPage(),
      ErrorPage()
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pages[index]),
          ),
          child: Container(
            width: 56.w,
            height: 56.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(136, 68, 205, 0.1),
            ),
            child: Icon(
              iconData,
              size: 24.sp,
              color: const Color.fromRGBO(121, 30, 195, 1),
            ),
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          label,
          style: TextStyle(fontSize: 12.sp),
        ),
      ],
    );
  }
}
