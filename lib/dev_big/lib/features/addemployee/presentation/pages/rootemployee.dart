import 'package:depertment_of_labor_employers/features/addemployee/presentation/pages/waitforconfimation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RootEmployeePage extends StatelessWidget {
  final tabss = <Widget>[
    Tab(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text("รอการยืนยัน", style: TextStyle(fontSize: 12.sp)),
          ],
        ),
      ),
    ),
    Tab(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text("รอการอนุมัติ", style: TextStyle(fontSize: 12.sp)),
            Text("จากเจ้าหน้าที่รัฐ", style: TextStyle(fontSize: 12.sp)),
          ],
        ),
      ),
    ),
    Tab(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text("ประวัติ", style: TextStyle(fontSize: 12.sp)),
          ],
        ),
      ),
    ),
  ];

  final List<Widget> tabViews = [
    WaitingForConfirmation(),
    WaitingForConfirmation(),
    WaitingForConfirmation(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabss.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('แจ้งเข้าทำงาน'),
          elevation: 1,
          shadowColor: Colors.black,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48), // Set the desired height here
            child: TabBar(
              labelColor: Colors.purple,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 3.w,
                  color: Colors.purple,
                ),
                insets: EdgeInsets.symmetric(horizontal: 0),
              ),
              indicatorSize: TabBarIndicatorSize
                  .label, // This property controls the height of the TabBar
              tabs: tabss,
            ),
          ),
        ),
        body: TabBarView(children: tabViews),
      ),
    );
  }
}
