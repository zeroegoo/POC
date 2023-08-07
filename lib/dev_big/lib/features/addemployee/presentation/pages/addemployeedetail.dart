import 'package:depertment_of_labor_employers/features/addemployee/presentation/widgets/dialogaddemployee.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddEmployeeDetail extends StatelessWidget {
  final String? page;
  const AddEmployeeDetail({super.key, this.page});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> itemList = [
      {
        'image':
            'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        'name': 'นาย หม่อง ทาดี',
        'country': 'ลาว',
        'passport_id': 'D658965',
        'status': 'waitemployer',
        'employer': "",
        'date': '8 กพ. 2565'
      },

      //'waitemployer','waitapprove','approve'
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('แจ้งเข้าทำงาน'),
        elevation: 1,
        shadowColor: Colors.black,
      ),
      body: Container(
        color: Colors.grey,
        width: 1.sw,
        height: 1.sh,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 24.sp),
                    child: Container(
                      height: 0.4.sh,
                      width: ScreenUtil().screenWidth,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(24.0.sp),
                            child: CircleAvatar(
                              radius: 50.r,
                              backgroundImage:
                                  NetworkImage(itemList[0]['image']),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 24.w, // Adjust image width as needed
                                height: 24.h, // Adjust image height as needed
                                child: Image.asset(
                                  'assets/images/languages_flag/cambodia.png',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: Text('กัมพูชา'),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 12.sp, bottom: 12.sp),
                            child: Text(
                              itemList[0]['name'],
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text("สถานะ"),
                                    if (itemList[0]['status'] == 'waitemployer')
                                      Card(
                                        color: Colors.grey,
                                        shadowColor: Colors.transparent,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 8.w,
                                              right: 8.w,
                                              top: 4.h,
                                              bottom: 4.h),
                                          child: Text(
                                            "รอนายจ้างยืนยัน",
                                            style: TextStyle(
                                                color: Colors.blueGrey),
                                          ),
                                        ),
                                      ),
                                    if (itemList[0]['status'] == 'waitapprove')
                                      Card(
                                        color: Colors.orangeAccent,
                                        shadowColor: Colors.transparent,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 8.w,
                                              right: 8.w,
                                              top: 4.h,
                                              bottom: 4.h),
                                          child: Text(
                                            "รอการอนุมัติ",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    if (itemList[0]['status'] == 'approve')
                                      Card(
                                        color: Colors.greenAccent,
                                        shadowColor: Colors.transparent,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 8.w,
                                              right: 8.w,
                                              top: 4.h,
                                              bottom: 4.h),
                                          child: Text(
                                            "ได้รับใบอนุญาต",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 0.05.sw,
                                      right: 0.05.sw,
                                      top: 8.h,
                                      bottom: 8.h),
                                  child: Container(
                                    width: 1
                                        .w, // Set the width to occupy the available space
                                    height: 40.0
                                        .h, // Adjust the height to control the length of the line
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text("นายจ้าง"),
                                    if (itemList[0]['employer'] != null)
                                      Text(itemList[0]['employer']),
                                    if (itemList[0]['employer'] == null ||
                                        itemList[0]['employer'].length == 0)
                                      Text("-")
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 24.h),
                    width: ScreenUtil().screenWidth,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 24.h, bottom: 5.h),
                          child: Text(
                            'ข้อมูลลูกจ้าง',
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
                          child: Text(
                            'ใบอนุญาตทำงานเลขที่',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Text(
                          '1000000000',
                          style: TextStyle(color: Colors.black),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
                          child: Text(
                            'ชื่อ',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Text(
                          'หม่อง ทองดี',
                          style: TextStyle(color: Colors.black),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
                          child: Text(
                            'วัน ดือน ปีเกิด',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Text(
                          '12 มกราคม 2539',
                          style: TextStyle(color: Colors.black),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
                          child: Text(
                            'สัญชาต',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Text(
                          'กัมพุชา',
                          style: TextStyle(color: Colors.black),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
                          child: Text(
                            'หนังสือเดินทาง/เอกสารใช้แทนเลขที่',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Text(
                          'D658965',
                          style: TextStyle(color: Colors.black),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
                          child: Text(
                            'ท้องที่จังหวัดที่ได้รับอนุญาตให้ทำงาน',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Text(
                          'กรุงเทพ',
                          style: TextStyle(color: Colors.black),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
                          child: Text(
                            'ประเภทงานที่ได้รับอนุญาตให้ทำงาน',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: Text(
                            'ก่อสร้าง',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        shadowColor: Colors.black,
        child: Row(
          children: [
            Expanded(
              child: page == 'confirm'
                  ? ElevatedButton(
                      child: Text(
                        "ปฎิเสธ",
                        style: TextStyle(
                            color: Color.fromRGBO(121, 30, 195, 1),
                            fontSize: 16.sp),
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(
                              vertical: 10.0.w, horizontal: 20.0.h),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                            side: BorderSide(
                              color: Color.fromRGBO(
                                  121, 30, 195, 1), // Set the border color here
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
                    )
                  : ElevatedButton(
                      child: Text(
                        "ยกเลิก",
                        style: TextStyle(
                            color: Color.fromRGBO(121, 30, 195, 1),
                            fontSize: 16.sp),
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(
                              vertical: 10.0.w, horizontal: 20.0.h),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                            side: BorderSide(
                              color: Color.fromRGBO(
                                  121, 30, 195, 1), // Set the border color here
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
              child: page == 'confirm'
                  ? ElevatedButton(
                      child: Text(
                        "ยืนยัน",
                        style: TextStyle(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 16.sp),
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
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
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return DialogAddEmployee(
                              dialog: '2',
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
                    )
                  : ElevatedButton(
                      child: Text(
                        "แจ้งเข้าทำงาน",
                        style: TextStyle(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 16.sp),
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
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
      ),
    );
  }
}
