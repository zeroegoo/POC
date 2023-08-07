import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/gridbody.dart';
import '../widgets/newsslide.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          color: Colors.purple,
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 0.15.sh,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0.h,
                        right: 10.w,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Container(
                            width: 0.22.sw,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'ภาษาไทย',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color.fromRGBO(21, 21, 21, 1),
                                    fontFamily: 'IBM Plex Sans Thai',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    height: 1.h,
                                  ),
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                SizedBox(
                                  width: 24.w, // Adjust image width as needed
                                  height: 24.h, // Adjust image height as needed
                                  child: Image.asset(
                                    'assets/images/languages_flag/thailand.png',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0.05.sh,
                        left: 10.w,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors
                                .transparent, // Set the background color to transparent
                            shadowColor: Colors.transparent, // Remove shadow
                          ),
                          child: Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 20
                                      .r, // Adjust the radius as needed for the circle size
                                  child: Icon(
                                    Icons.person,
                                    color: Colors
                                        .white, // Set the color of the icon (optional)
                                    size: 20
                                        .sp, // Set the size of the icon (optional)
                                  ),
                                ),
                                SizedBox(width: 6.w),
                                Text(
                                  'สวัสดี! Big',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'IBM Plex Sans Thai',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    height: 1.h,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 0.30.sh, child: MyGridView()),
                    Container(
                      color: Colors.white,
                      height: 0.05.sh, // Set the desired width of the container
                      padding: EdgeInsets.only(
                          left: 24.w), // Optional padding around the text

                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'ข่าวสารจากกระทรวงแรงงาน',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 0.30.sh, child: NewsSlide())
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
