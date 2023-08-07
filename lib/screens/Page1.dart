import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../constans/constans.dart';
import '../utils/status_employee.dart';
import '../widgets/Language_Widget.dart';
import 'Page3.dart';
import 'Page2.dart';
import 'Page4.dart';

class Page1 extends StatelessWidget {
  // ถ้ามี widgets ต้องใส่ static
  static final List<IconModel> iconsMenu = [
    IconModel(
      name: "ขอใบอนุณาต",
      iconData: Icons.email_rounded,
      pages: Page2(),
    ),
    IconModel(
      name: "ขอใบแทน",
      iconData: Icons.list_rounded,
      pages: Page1(),
    ),
    IconModel(
      name: "ขอต่ออายุ",
      iconData: Icons.lock_clock,
      pages: Page3(),
    ),
    IconModel(
      name: "ขอแก้ไขรายการ",
      iconData: Icons.mode_edit_rounded,
      pages: Page4(),
    ),
    IconModel(
      name: "Work permit",
      iconData: Icons.person,
      pages: Page1(),
    ),
    IconModel(
      name: "อื่นๆ",
      iconData: Icons.settings_outlined,
      pages: Page2(),
    ),
  ];

  static final List<Widget> news = [
    Container(color: Colors.purpleAccent),
    Container(color: primaryColor),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('BottomNavigationBar Sample'),
        // ),
        body: Column(
      children: [
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(bottom: 5.h), // ดันให้แสดง shadow
          height: 0.39.sh,
          child: Stack(alignment: Alignment.center, children: [
            Positioned(
              top: 0,
              child: Stack(alignment: Alignment.center, children: [
                Container(
                  color: primaryColor,
                  width: 1.sw,
                  height:
                      0.29.sh - 5.h, // ดันให้เท่ากับด้านล่างเผื่อให้กึ่งกลาง
                ),
                Positioned(
                  bottom: 0.1.sh,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5.r),
                    width: 0.8.sw,
                    child: Row(
                      children: [
                        Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white24),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "สวัสดี! ",
                          style: TextStyle(fontSize: 24.sp,color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Language_widget(),
              ]),
            ),
            const Positioned(
              bottom: 0,
              child: status_employee(),
            ),
          ]),
        ),
        Expanded( // เลื่อนทั้งหน้า เอาออก
          child: SingleChildScrollView( // เลื่อนทั้งหน้า เอาออก เปลี่ยนไปเพิ่ม ที่ body
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              width: 1.sw,
              // height: 0.6.sh,
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  SizedBox(
                    height: 0.33.sh,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      removeBottom: true,
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent:
                                0.3.sw, // กำหนดความกว้างของคอลัมน์ให้เหมาะสม
                            crossAxisSpacing: 16.w,
                            mainAxisSpacing: 16.h,
                            childAspectRatio: 1.0,
                          ),
                          itemCount: iconsMenu.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(iconsMenu[index].pages,
                                    transition: Transition.zoom);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: primaryColor.withOpacity(
                                          0.1), // สีพื้นหลังของ Icon
                                    ),
                                    child: Center(
                                      child: Icon(
                                        iconsMenu[index].iconData,
                                        size: 28.0,
                                        color: primaryColor, // สีของ Icon
                                      ),
                                    ),
                                  ),
                                  Text(
                                    iconsMenu[index].name,
                                    style: TextStyle(fontSize: 12.sp),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'ข่าวสารจากกระทรวงแรงงาน',
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 1.sw,
                    height: 0.22.sh,
                    child: CarouselSlider.builder(
                      itemCount: news.length,
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 8),
                        viewportFraction: 1.0,
                        // enlargeCenterPage: true,
                      ),
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.r),
                              child: news[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

class IconModel {
  final String name;
  final IconData iconData;
  final Widget pages;

  IconModel({required this.name, required this.iconData, required this.pages});
}
