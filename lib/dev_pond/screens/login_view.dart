import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constans/constans.dart';
import '../widgets/Language_Widget.dart';
import 'bottom_navigation_bar_view.dart';

class Login_View extends StatelessWidget {
  const Login_View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
              width: 1.sw,
              height: 1.sh,
              decoration: BoxDecoration(
                color: Color.fromRGBO(121, 30, 195, 1),
              ),
              child: Stack(children: [
                Language_widget(),
                Padding(
                  padding: EdgeInsets.only(bottom: 0.50.sh),
                  child: Center(
                    child: SafeArea(
                      child: SizedBox(
                        height: 0.25.sh,
                        // width: 191.w,
                        child: Image.asset(
                          'assets/power_banner.png',fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                      height: 0.55.sh,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          topRight: Radius.circular(16.r),
                        ),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 8.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'ยินดีต้อนรับ',
                            style: TextStyle(fontSize: 28.sp),
                          ),
                          TextFormField(
                            //obscureText: true,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: 18.sp),
                              hintText: 'หมายเลขนิติบุคคล',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.r)),
                              ),
                              contentPadding: EdgeInsets.all(14.r)
                            ),
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: 18.sp),
                              hintText: 'รหัสผ่าน',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.r)),
                              ),
                                contentPadding: EdgeInsets.all(14.r)
                            ),
                          ),
                          SizedBox(
                            height: 45.h,
                            width: ScreenUtil().screenWidth,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(primaryColor),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Get.to(BottomNavigationBarExample(),transition: Transition.zoom);
                              },
                              child: Text(
                                "เข้าสู่ระบบ",
                                style: TextStyle(
                                    color:Colors.white,
                                    fontSize: 16.sp),
                              ),
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'ลืมรหัสผ่าน',
                                style: TextStyle(fontSize: 16.sp),
                              )),
                          Divider(
                            color: Colors.grey.withOpacity(0.5),
                            height: 1.h,
                            thickness: 1.sp,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'สร้างบัญชีใหม่',
                                style: TextStyle(fontSize: 16.sp),
                              )),
                        ],
                      ),
                    )),
              ])),
        ));
  }
}
