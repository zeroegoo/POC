import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color primaryColor = Color.fromARGB(255, 131, 61, 205);
// Color blackColor = Color.fromARGB(255, 136, 68, 205);


TextStyle optionStyle(double size) {
  return TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: size.sp,
    inherit: false,
  );
}
