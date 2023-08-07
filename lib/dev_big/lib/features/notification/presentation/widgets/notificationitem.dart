import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsItem extends StatelessWidget {
  const NotificationsItem({Key? key, required this.isnews}) : super(key: key);

  final bool isnews;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isnews ? Color.fromRGBO(253, 186, 70, 0.1) : Colors.white,
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              top: isnews
                  ? 15.h
                  : 0.h, // Adjust the top padding for the first item
              bottom: 10.h,
            ),
            child: isnews
                ? Text(
                    'มาใหม่',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      background: Paint()
                        ..color = Color.fromRGBO(253, 186, 70, 1)
                        ..strokeWidth = 20.sp
                        ..strokeJoin = StrokeJoin.round
                        ..strokeCap = StrokeCap.round
                        ..style = PaintingStyle.stroke,
                      color: Colors.white,
                    ),
                  )
                : Container(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              "คำขอใบอนุญาตทำงานได้รับการอนุมัติ",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 2.h, bottom: 2.h),
            child: Text(
              '12 ต.ค. 2563',
              style: TextStyle(color: Colors.grey, fontSize: 14.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, bottom: 5.h),
            child: Text(
              'คำขอใบอนุญาติทำงานของคุณได้ระบการอนุมัติจากกระทรวงแรงงาน',
              style: TextStyle(color: Colors.grey, fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}
