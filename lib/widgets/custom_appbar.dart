import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class appbar extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Color? color;
  final String? backgroundImagePath;

  appbar({
    required this.title,
    this.icon,
    this.color,
    this.backgroundImagePath,
  });

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration;
    if (color != null) {
      decoration = BoxDecoration(
        color: color,
        boxShadow: [
          shadow(),
        ],
      );
    } else if (backgroundImagePath != null) {
      decoration = BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImagePath!),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          shadow(),
        ],
      );
    } else {
      // Default decoration if no color or background image is provided
      decoration = BoxDecoration(
        color: Colors.white,
        boxShadow: [
          shadow(),
        ],
      );
    }

    return Container(
      height: 0.125.sh,
      width: 1.sw,
      decoration: decoration,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon != null
                ? SizedBox(
                    width: 60.w,
                    child: IconButton(
                      icon: Icon(icon, color: Colors.black),
                      onPressed: () {
                        // เพิ่มโค้ดเมื่อกดปุ่ม Icon ฝั่งซ้าย
                        Get.back();
                      },
                    ),
                  )
                : SizedBox(
                    width: 60.w,
                  ),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 60.w,
            ),
          ],
        ),
      ),
    );
  }
}

BoxShadow shadow() {
  return BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 2,
    blurRadius: 2,
    offset: Offset(0, -2),
  );
}
