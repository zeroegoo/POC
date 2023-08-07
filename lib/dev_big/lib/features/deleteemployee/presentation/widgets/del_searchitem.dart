import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeleteSearchEmployeeItem extends StatelessWidget {
  final int index;
  final Map<String, dynamic> item;
  const DeleteSearchEmployeeItem(
      {super.key, required this.index, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: index == 0
          ? EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w, bottom: 16.h)
          : EdgeInsets.only(top: 6.h, left: 16.w, right: 16.w, bottom: 16.h),
      padding: EdgeInsets.all(24.0.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 5, // Blur radius
            offset: Offset(0, 2), // Offset in x and y directions
          ),
        ],
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              item['image'],
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ชื่อ',
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                Text('เลขพาสปอร์ท',
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                Text('ประเทศ',
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                Text('วันที่',
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['name'],
                      style: TextStyle(fontSize: 12.sp, color: Colors.black)),
                  Text(item['passport_id'],
                      style: TextStyle(fontSize: 12.sp, color: Colors.black)),
                  Text(item['country'],
                      style: TextStyle(fontSize: 12.sp, color: Colors.black)),
                  Text(item['date'],
                      style: TextStyle(fontSize: 12.sp, color: Colors.black)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
