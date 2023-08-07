import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constans/constans.dart';

class CustomButton_Widget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;

  CustomButton_Widget({
    required this.text,
    required this.onPressed,
    this.backgroundColor = primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      width: 0.3.sw,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.r),
            side:
                BorderSide(color: primaryColor), // กำหนดสีขอบของ ElevatedButton
          ),
          elevation: 0,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Center(
            child: Text(text,
                style: TextStyle(
                    color: backgroundColor == primaryColor
                        ? Colors.white
                        : primaryColor)),
          ),
        ),
      ),
    );
  }
}
