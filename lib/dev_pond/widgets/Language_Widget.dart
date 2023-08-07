import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../main.dart';

class Language_widget extends ConsumerWidget {
  Language_widget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flags = ref.watch(currentLanguage);

    void changeLanguage(String lang) {
      Locale locale = new Locale(lang);
      Get.updateLocale(locale);
      Get.back(); // ปิด Dialog เมื่อเลือกภาษา

      ref.read(currentLanguage.notifier).state = lang;
    }

    return Positioned(
      top: 15.h,
      right: 15.w,
      child: SafeArea(
        child: Container(
          height: 32.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(30.r), // กำหนดความโค้งของกรอบเป็น 30.0
              ),
            ),
            onPressed: () {
              Get.dialog(
                SimpleDialog(
                  title: Text('Select Language'),
                  children: [
                    ListTile(
                        leading: Image.asset('assets/en.png'),
                        title: Text('English'),
                        onTap: () {
                          changeLanguage('en');
                        }),
                    ListTile(
                        leading: Image.asset('assets/th.png'),
                        title: Text('ไทย'),
                        onTap: () {
                          changeLanguage('th');
                        }),
                    ListTile(
                        leading: Image.asset('assets/la.png'),
                        title: Text('ລາວ'),
                        onTap: () {
                          changeLanguage('la');
                        }),
                    ListTile(
                        leading: Image.asset('assets/kh.png'),
                        title: Text('កម្ពុជា។'),
                        onTap: () {
                          changeLanguage('kh');
                        }),
                    ListTile(
                        leading: Image.asset('assets/mm.png'),
                        title: Text('မြန်မာ'),
                        onTap: () {
                          changeLanguage('mm');
                        }),
                  ],
                ),
              );
            },
            child: Row(
              children: [
                Text(
                  "language".tr,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
            SizedBox(width: 6.w,),
            Image.asset(
              'assets/$flags.png', // ใช้ค่าของ currentLanguage ในการอ้างอิงไปยังไฟล์ภาพธงชาติที่ถูกเลือก
              width: 24.w,
              height: 24.h,
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
