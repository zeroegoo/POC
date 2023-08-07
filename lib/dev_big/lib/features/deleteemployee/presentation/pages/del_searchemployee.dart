import 'package:depertment_of_labor_employers/features/deleteemployee/presentation/widgets/del_searchitem.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../addemployee/presentation/widgets/dialogaddemployee.dart';

class DeleteEmployeeSearch extends StatelessWidget {
  const DeleteEmployeeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> itemList = [
      {
        'image':
            'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        'name': 'หม่อง ทาดี',
        'country': 'กัมพูชา',
        'passport_id': 'D658965',
        'date': '8 กพ. 2565'
      },
      {
        'image':
            'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        'name': 'จันดี หม่อง',
        'country': 'ลาว',
        'passport_id': 'A258962',
        'date': '8 กพ. 2565'
      },
    ];
    bool isVisible = false;
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('แจ้งออกจากงาน'),
        elevation: 1,
        shadowColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount:
            1 + itemList.length, // +1 for the other widgets inside Column
        itemBuilder: (context, index) {
          if (index == 0) {
            // Index 0 is for the non-scrollable widgets
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(24.sp),
                  child: Text(
                    "กรุณาเลือกลูกจ้าง",
                    style: TextStyle(fontSize: 24.sp, color: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.sp),
                  height: 50.h,
                  width: ScreenUtil().screenWidth,
                  child: TextField(
                    controller: searchController,
                    style: TextStyle(fontSize: 16.sp),
                    decoration: InputDecoration(
                      suffixIcon: isVisible
                          ? IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.clear),
                            )
                          : Container(
                              width: 0,
                              height: 0,
                            ),
                      hintText: 'ค้นหา', // Set the hint text here
                      border: OutlineInputBorder(
                        // Set the border
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Colors.grey, // Set the border color here
                          width: 1.0, // Set the border width here
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        // Set the border when the TextField is enabled
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Colors.grey, // Set the border color here
                          width: 1.0, // Set the border width here
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        // Set the border when the TextField is focused
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Colors.blue, // Set the border color here
                          width: 2.0, // Set the border width here
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            // Index from 1 to itemCount is for your scrollable items
            final item = itemList[
                index - 1]; // Subtract 1 to get the correct item from itemList
            return DeleteSearchEmployeeItem(index: index - 1, item: item);
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        shadowColor: Colors.black,
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                child: Text(
                  "ถัดไป",
                  style: TextStyle(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 16.sp),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 10.0.w, horizontal: 20.0.h),
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
                  //Navigator.pop(context);
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
