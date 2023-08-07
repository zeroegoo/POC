import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialog_Widget extends StatelessWidget {
  CustomDialog_Widget({
    required this.title,
    this.message,
    this.iconImage,
    this.widgets,
    this.actions = const [],
  });

  final String title;
  final String? message;
  final String? iconImage;
  final List<Widget>? widgets;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconImage != null) ...[
            Image.asset(
              iconImage!,
              height: 80.h,
              width: 80.w,
            ),
            SizedBox(height: 10.h),
          ],
          Text(title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center),
          SizedBox(height: 10.h),
          if (message != null) ...[
            Text(
              message!,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
          ],
          if (widgets != null) ...widgets!,
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: actions.length == 2
                ? MainAxisAlignment.spaceEvenly
                : MainAxisAlignment.center,
            children: actions.length == 1
                ? [
                    Expanded(child: actions[0])
                  ] // ใส่ Expanded ให้ปุ่มเต็มความกว้าง
                : actions,
          ),
        ],
      ),
    );
  }
}
