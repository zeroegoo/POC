import 'dart:ffi';

import 'package:employee_app/constans/constans.dart';
import 'package:employee_app/main.dart';
import 'package:employee_app/utils/calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../widgets/CustomButton_Widget.dart';
import '../widgets/CustomDialog_widget.dart';
import '../utils/time_picker_widget.dart';
import 'login_view.dart';
import 'package:intl/intl.dart';

var valueProvider = StateProvider((ref) => 'กรุณาเลือกเวลา');
final dateProvider = StateNotifierProvider<formatSelectedDay, String>(
    (_) => formatSelectedDay());

class formatSelectedDay extends StateNotifier<String> {
  formatSelectedDay() : super('เลือกวันที่นัดหมาย');

  void formatYearTH(DateTime date) {
    final formattedDate = DateFormat('dd-MM').format(date);
    final buddhistYear = (date.year + 543).toString();
    state = '$formattedDate-$buddhistYear';
  }

  void formatYearEN(DateTime date) {
    final formattedDate = DateFormat('dd-MM').format(date);
    final year = (date.year).toString();
    state = '$formattedDate-$year';
  }
}

class Page4 extends ConsumerWidget {
  Page4({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _value = ref.watch(valueProvider);
    var _date = ref.watch(dateProvider);
    var _language = ref.watch(currentLanguage);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('test dialog'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Login_View(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors
                  .white, // หากคุณไม่ต้องการสีของ Container แสดงผล คุณสามารถเปลี่ยนเป็น Colors.transparent เพื่อให้เป็นสีโปร่งแสง
              child: Center(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialog_Widget(
                              title: 'ยืนยันการขอใบอนุญาต',
                              actions: [
                                CustomButton_Widget(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  text: 'ยกเลิก',
                                  backgroundColor: Colors.white,
                                ),
                                CustomButton_Widget(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  text: 'ยืนยัน',
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        'ยืนยันใบอนุญาต',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialog_Widget(
                              iconImage: 'assets/check.png',
                              title: 'ยื่นคำขอสำเร็จ',
                              message:
                                  'ข้อมูลของคุณถูกส่งไปยังเจ้าหน้าที่เพื่อ รับการตรวจสอบและอนุมัติ',
                              actions: [
                                CustomButton_Widget(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  text: 'ตกลง',
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        'ยื่นคำขอสำเร็จ',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    //////////////////////////////////////////////////////////////////////////// เลือกวัน
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialog_Widget(
                              title: 'กรุณาเลือกวัน',
                              widgets: [Calendar_Widget()],
                              actions: [
                                CustomButton_Widget(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  text: 'ยกเลิก',
                                  backgroundColor: Colors.white,
                                ),
                                CustomButton_Widget(
                                  onPressed: () {
                                    _language == 'th'
                                        ? ref
                                            .read(dateProvider.notifier)
                                            .formatYearTH(
                                                ref.watch(selectedDayProvider))
                                        : ref
                                            .read(dateProvider.notifier)
                                            .formatYearEN(
                                                ref.watch(selectedDayProvider));
                                    print("_date => ${_date}");
                                    Get.back();
                                  },
                                  text: 'ตกลง',
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        'กรุณาเลือกวัน',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialog_Widget(
                              title: 'กรุณาเลือกเวลา',
                              widgets: [Time_Picker_Widget()],
                              actions: [
                                CustomButton_Widget(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  text: 'ยกเลิก',
                                  backgroundColor: Colors.white,
                                ),
                                CustomButton_Widget(
                                  onPressed: () {
                                    ref.read(valueProvider.notifier).state =
                                        ref.watch(selectedTimeProvider);
                                    // print("_time : " + ref.watch(selectedTimeProvider));
                                    Get.back();
                                  },
                                  text: 'ยืนยัน',
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        'กรุณาเลือกเวลา',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialog_Widget(
                              title: 'ยืนยันการนัดหมาย',
                              message:
                                  'ต้องการยืนยันการนัดหมาย\nตามวันและเวลาดังกล่าวหรือไม่',
                              actions: [
                                CustomButton_Widget(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  text: 'ยกเลิก',
                                  backgroundColor: Colors.white,
                                ),
                                CustomButton_Widget(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  text: 'ยืนยัน',
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        'ยืนยันการนัดหมาย',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "เลือกวัน => ${_date}",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "เลือกเวลา => $_value",
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
