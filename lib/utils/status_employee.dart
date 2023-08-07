import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constans/constans.dart';

class status_employee extends StatelessWidget {
  const status_employee({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.8.sw,
      height: 0.2.sh,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      // color: Colors.white,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            // offset: Offset(0, 3) // เปลี่ยนตำแหน่งแกน x, y ของเงา
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "สถานะใบอนุณาต",
                style: TextStyle(fontSize: 14.sp),
              ),
              Text(
                "ไม่มีใบอนุณาต",
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "วันที่ขอใบอนุณาต",
                style: TextStyle(fontSize: 14.sp),
              ),
              Text(
                "-",
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          SizedBox(
            height: 40.h,
            width: 1.sw,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(primaryColor),
              ),
              onPressed: () {},
              child: Text(
                "ยื่นขอใบอนุณาต",
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
