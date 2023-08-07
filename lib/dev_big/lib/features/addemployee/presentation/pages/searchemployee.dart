import 'package:depertment_of_labor_employers/features/addemployee/presentation/pages/addemployeedetail.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../widgets/waitforconfirmationitem.dart';

final isSelectedProvider = StateProvider<List<bool>>((ref) => [true, false]);

void toast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.black,
      fontSize: 16.0.sp);
}

class TodoNotifier extends StateNotifier<bool> {
  TodoNotifier() : super(false);

  void search(String id) {
    print(id);
    if (id == "D658965") {
      state = true;
    } else {
      toast("no user");
      state = false;
    }
  }

  void visiblesearch(bool isVisible) {
    // if (isVisible == false) {
    //   state = true;
    // } else if (isVisible == true) {
    //   state = false;
    // }
  }
}

final todoProvider = StateNotifierProvider<TodoNotifier, bool>(
  (ref) {
    return TodoNotifier();
  },
);

class SeachEmployee extends ConsumerWidget {
  const SeachEmployee({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isSearch = false;
    bool isVisible = false;
    final List<Map<String, dynamic>> itemList = [
      {
        'image':
            'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        'name': 'หม่อง ทาดี',
        'country': 'กัมพูชา',
        'passport_id': 'D658965',
        'date': '8 กพ. 2565'
      },
    ];
    //List<bool> _isSelected = [true, false];
    //isVisible = ref.watch(todoProvider);
    TextEditingController passportIDController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: const Text('แจ้งเข้าทำงาน'),
          elevation: 1,
          shadowColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 0.05.sh),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      final isSelected = ref.watch(isSelectedProvider);
                      //isVisible = ref.watch(isSelectedProvider);
                      return Container(
                        margin: EdgeInsets.only(
                            left: 20.sp, right: 20.sp, bottom: 16.sp),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(230, 230, 230, 1),
                          borderRadius:
                              BorderRadius.all(Radius.circular(8.0.sp)),
                        ),
                        child: ToggleButtons(
                          // constraints: BoxConstraints.expand(width: 0..sw),

                          color: Color.fromRGBO(180, 180, 180, 1),
                          isSelected: isSelected,
                          fillColor: Color.fromRGBO(230, 230, 230, 1),
                          selectedColor: Colors.purple,
                          onPressed: (index) {
                            ref.read(isSelectedProvider.notifier).state =
                                List.generate(
                              isSelected.length,
                              (i) => i == index,
                            );
                            // _isSelected =
                            //     _isSelected.map((selected) => !selected).toList();
                          },
                          //fillColor: Colors.grey,
                          borderRadius: BorderRadius.circular(8.sp),

                          borderWidth: 8.sp,
                          //focusColor: Colors.black,
                          //disabledColor: Colors.black,
                          //highlightColor: Colors.black,
                          borderColor: Color.fromRGBO(180, 180, 180, 1),
                          //selectedBorderColor: Colors.black,
                          renderBorder: false,
                          // splashColor: Colors.white,
                          //hoverColor: Colors.black,

                          children: [
                            Container(
                              width: 0.40.sw,
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(8.sp),
                              padding: EdgeInsets.all(8.sp),
                              decoration: BoxDecoration(
                                color: isSelected[0]
                                    ? Colors.white
                                    : Color.fromRGBO(230, 230, 230, 1),
                                borderRadius: BorderRadius.circular(4
                                    .sp), // Adjust the radius to your preference
                                // border: Border.all(
                                //     color: Colors.white,
                                //     width: 1.0), // Border properties (optional)
                              ),
                              child: Text(
                                'เลข passport',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ),
                            Container(
                              width: 0.40.sw,
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(8.sp),
                              padding: EdgeInsets.all(8.sp),
                              decoration: BoxDecoration(
                                color: isSelected[1]
                                    ? Colors.white
                                    : Color.fromRGBO(230, 230, 230, 1),
                                borderRadius: BorderRadius.circular(4
                                    .sp), // Adjust the radius to your preference
                                // border: Border.all(
                                //     color: Colors.white,
                                //     width: 1.0), // Border properties (optional)
                              ),
                              child: Text(
                                'เลขบัตรต่างด้าว',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Consumer(builder: (context, ref, child) {
                    isVisible = ref.watch(todoProvider);

                    return Container(
                      margin: EdgeInsets.all(20.sp),
                      height: 50.h,
                      width: ScreenUtil().screenWidth,
                      child: TextField(
                        controller: passportIDController,
                        style: TextStyle(fontSize: 16.sp),
                        decoration: InputDecoration(
                          suffixIcon: isVisible
                              ? IconButton(
                                  onPressed: () {
                                    passportIDController.clear();
                                    ref.read(todoProvider.notifier).search("");
                                    ref
                                        .read(todoProvider.notifier)
                                        .visiblesearch(isVisible);
                                  },
                                  icon: Icon(Icons.clear))
                              : Container(
                                  width: 0,
                                  height: 0,
                                ),
                          hintText:
                              'หมายเลข passport', // Set the hint text here
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
                    );
                  }),
                  Consumer(builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    isSearch = ref.watch(todoProvider);
                    print(isSearch);

                    final item = itemList[0];
                    if (isSearch == true) {
                      return GestureDetector(
                          onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddEmployeeDetail(
                                          page: 'add',
                                        )),
                              ),
                          child: WaitForConfirmationItem(index: 0, item: item));
                    } else {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(20.sp),
                            height: 40.h,
                            width: ScreenUtil().screenWidth,
                            child: ElevatedButton(
                              child: Text(
                                "ค้นหา",
                                style: TextStyle(
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
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
                                FocusScope.of(context).unfocus();

                                ref
                                    .read(todoProvider.notifier)
                                    .search(passportIDController.text);
                                // ref
                                //     .read(todoProvider.notifier)
                                //     .visiblesearch(isVisible);
                              },
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 0.44
                                    .sw, // Adjust the width of the horizontal line
                                height:
                                    1, // Adjust the height of the horizontal line
                                color: Colors
                                    .grey, // Adjust the color of the horizontal line
                              ),
                              SizedBox(
                                  width: 0.01
                                      .sw), // Add some space between the horizontal line and text
                              Container(
                                width: 0.1.sw,
                                child: Text(
                                  'หรือ',
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                              ),
                              SizedBox(
                                  width: 0.01
                                      .sw), // Add some space between the text and the next horizontal line
                              Container(
                                width: 0.44
                                    .sw, // Adjust the width of the horizontal line
                                height:
                                    1, // Adjust the height of the horizontal line
                                color: Colors
                                    .grey, // Adjust the color of the horizontal line
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.all(20.sp),
                            height: 40.h,
                            width: ScreenUtil().screenWidth,
                            child: ElevatedButton(
                              child: Text(
                                "สแกน QR Code",
                                style: TextStyle(
                                    color: Color.fromRGBO(121, 30, 195, 1),
                                    fontSize: 16.sp),
                              ),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(
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
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 255, 255, 255),
                                ),
                                // shape: MaterialStateProperty.all(
                                //   RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(4),
                                //   ),
                                // ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      );
                    }
                  })
                ]),
          ),
        ));
  }
}
