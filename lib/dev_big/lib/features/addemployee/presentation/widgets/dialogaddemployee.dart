import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogAddEmployee extends StatelessWidget {
  final String dialog;
  const DialogAddEmployee({super.key, required this.dialog});

  @override
  Widget build(BuildContext context) {
    return dialog == '1'
        ? Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 80.sp,
                    color: Color.fromRGBO(121, 30, 195, 1),
                  ),
                  SizedBox(height: 8.sp),
                  Text(
                    'แจ้งเข้าทำงานสำเร็จ',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.sp),
                  Center(
                    child: Text(
                      'ข้อมูลของคุณถูกส่งไปยังเจ้าหน้าที่เพื่อรับการตรวจสอบและอนุมัติ',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                  SizedBox(height: 18.sp),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          child: Text(
                            "ตกลง",
                            style: TextStyle(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 18.sp),
                          ),
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.symmetric(
                                  vertical: 10.0.w, horizontal: 20.0.h),
                            ),
                            // fixedSize: MaterialStateProperty.all(
                            //     Size(ScreenUtil().screenWidth,)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(121, 30, 195, 1),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            //Navigator.pushReplacementNamed(context, '/');
                            //Navigator.pushNamed(context, '/homepage');
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const SecondRoute()),
                            // );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        : Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'ยืนยันการรับเข้าทำงาน',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.sp),
                  Center(
                    child: Text(
                      'ต้องการยืนยันรับ นายหม่อง ทองดี เข้าทำงาน',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                  SizedBox(height: 18.sp),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          child: Text(
                            "ยกเลิก",
                            style: TextStyle(
                                color: Color.fromRGBO(121, 30, 195, 1),
                                fontSize: 16.sp),
                          ),
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.symmetric(
                                  vertical: 10.0.w, horizontal: 20.0.h),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: BorderSide(
                                  color: Color.fromRGBO(121, 30, 195,
                                      1), // Set the border color here
                                  width: 2.0, // Set the border width here
                                ),
                              ),
                            ),
                            // fixedSize: MaterialStateProperty.all(
                            //     Size(ScreenUtil().screenWidth,)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 255, 255, 255),
                            ),
                            // shape: MaterialStateProperty.all(
                            //   RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(4),
                            //   ),
                            // ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          child: Text(
                            "ยืนยัน",
                            style: TextStyle(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 16.sp),
                          ),
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.symmetric(
                                  vertical: 10.0.w, horizontal: 20.0.h),
                            ),
                            // fixedSize: MaterialStateProperty.all(
                            //     Size(ScreenUtil().screenWidth,)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(121, 30, 195, 1),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return DialogAddEmployee(
                                  dialog: '1',
                                );
                              },
                            );
                            //Navigator.pushReplacementNamed(context, '/');
                            //Navigator.pushNamed(context, '/homepage');
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const SecondRoute()),
                            // );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
