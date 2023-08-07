import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constans/constans.dart';

final selectedTimeIndexProvider = StateProvider((ref) => 0);
final selectedTimeProvider = StateProvider((ref) => 'กรุณาเลือกเวลา');


class Time_Picker_Widget extends ConsumerWidget {
  Time_Picker_Widget({super.key});
  
  List<String> _times = [
    '8:00',
    '9:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _selectedTimeIndex = ref.watch(selectedTimeIndexProvider);

    return Container(
      // color: Colors.yellow,
      height: 150.h,
      child: ListWheelScrollView(
        clipBehavior : Clip.antiAlias,
        physics: FixedExtentScrollPhysics(),
        itemExtent: 50.h,
        onSelectedItemChanged: (index) {
          ref.read(selectedTimeIndexProvider.notifier).state = index;
          ref.read(selectedTimeProvider.notifier).state = _times[index];
          print("_selectedTime => ${ref.watch(selectedTimeProvider)}");
        },
        children: List.generate(_times.length, (index) {
          final isSelected = index == _selectedTimeIndex;
          return _buildTimeItem(_times[index], isSelected);
        }),
      ),
    );
  }

  Widget _buildTimeItem(String time, bool isSelected) {
    return Center(
      child: Container(
        width: 1.sw,
        height: 50.h,
        decoration: BoxDecoration(
          color: isSelected ? primaryColor.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'รอบ    $time',
            style: TextStyle(
              color: primaryColor,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}