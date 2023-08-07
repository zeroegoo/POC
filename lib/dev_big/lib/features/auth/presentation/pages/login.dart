import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator EmployerlandingpageWidget - FRAME
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(121, 30, 195, 1),
            ),
            child: SafeArea(
              child: Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().screenHeight,
                  child: Stack(children: <Widget>[
                    Positioned.fill(
                      // This ensures the image takes the full size of the Stack
                      child: FractionallySizedBox(
                        alignment: Alignment.center,
                        heightFactor: 0.7
                            .h, // Adjust this value to set the height of the container (half of the screen in this case)
                        child: Align(
                          alignment: Alignment
                              .topCenter, // This centers the image within the FractionallySizedBox
                          child: Image.asset(
                            'assets/images/power_banner.png', // Replace with your image path
                            width: 191.w, // Adjust image width as needed
                            height: 191.h, // Adjust image height as needed
                          ),
                        ),
                      ),
                    ),
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
                        top: 0.40.sh,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                            ),
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 40.h),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'ยินดีต้อนรับ',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(21, 21, 21, 1),
                                    fontFamily: 'IBM Plex Sans Thai',
                                    fontSize: 24.sp,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                              SizedBox(height: 25.h),
                              SizedBox(
                                height: 40.h,
                                child: TextField(
                                  //obscureText: true,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 16.0.sp),
                                    hintText: 'หมายเลขนิติบุคคล',
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.0.sp, horizontal: 20.0.sp),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.h),
                              SizedBox(
                                height: 40.h,
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 16.0.sp),
                                    hintText: 'รหัสผ่าน',
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.0.w, horizontal: 20.0.h),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15.h),
                              SizedBox(
                                height: 40.h,
                                width: ScreenUtil().screenWidth,
                                child: ElevatedButton(
                                  child: Text(
                                    "เข้าสู่ระบบ",
                                    style: TextStyle(
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        fontSize: 16.sp),
                                  ),
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(
                                      EdgeInsets.symmetric(
                                          vertical: 10.0.w, horizontal: 20.0.h),
                                    ),
                                    // fixedSize: MaterialStateProperty.all(
                                    //     Size(ScreenUtil().screenWidth,)),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Color.fromRGBO(121, 30, 195, 1),
                                    ),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/');
                                    //Navigator.pushNamed(context, '/homepage');
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => const SecondRoute()),
                                    // );
                                  },
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'ลืมรหัสผ่าน',
                                        style: TextStyle(fontSize: 16.sp),
                                      )),
                                  Divider(
                                    color: Colors.grey,
                                    height: 5.0
                                        .h, // Adjust the height of the line as needed
                                    thickness: 1.0
                                        .sp, // Adjust the thickness of the line as needed
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'สร้างบัญชีใหม่',
                                        style: TextStyle(fontSize: 16.sp),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ])),
            ),
          ),
        ));
  }
}
