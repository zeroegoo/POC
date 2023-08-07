import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import '../constans/constans.dart';
import '../main.dart';
import 'package:intl/intl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final calendarFormatProvider = StateProvider((ref) => CalendarFormat.month);
final focusedDayProvider = StateProvider((ref) => DateTime.now());
final selectedDayProvider = StateProvider((ref) => DateTime.now());


class Calendar_Widget extends ConsumerWidget {
  Calendar_Widget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String language = ref.watch(currentLanguage);
    CalendarFormat _calendarFormat = ref.watch(calendarFormatProvider);
    DateTime _focusedDay = ref.watch(focusedDayProvider);
    DateTime _selectedDay = ref.watch(selectedDayProvider);


    return Column(
      children: [
        //เพิม
        TableCalendar(

          availableGestures: AvailableGestures.none,
          firstDay: DateTime.now(),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            ref.read(selectedDayProvider.notifier).state = selectedDay;
            ref.read(focusedDayProvider.notifier).state = focusedDay;
          },
          calendarFormat: _calendarFormat,
          onFormatChanged: (format) {
            ref.read(calendarFormatProvider.notifier).state = format;
          },
          headerVisible: true,
          headerStyle: HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false, // Hide the format button
            titleTextFormatter: (date, locale) {
              // Format the title text to display only the month and year in Thai
              final thaiMonthNames = [
                'มกราคม',
                'กุมภาพันธ์',
                'มีนาคม',
                'เมษายน',
                'พฤษภาคม',
                'มิถุนายน',
                'กรกฎาคม',
                'สิงหาคม',
                'กันยายน',
                'ตุลาคม',
                'พฤศจิกายน',
                'ธันวาคม',
              ];
              final englishMonthNames = [
                'January',
                'February',
                'March',
                'April',
                'May',
                'June',
                'July',
                'August',
                'September',
                'October',
                'November',
                'December',
              ];
              return (language == 'th')
                  ? '${thaiMonthNames[date.month - 1]} ${date.year + 543}'
                  : '${englishMonthNames[date.month - 1]} ${date.year}';
            },
          ),
          calendarBuilders: CalendarBuilders(
            dowBuilder: (context, day) {
              final thaiDayNames = [
                'อา.',
                'จ.',
                'อ.',
                'พ.',
                'พฤ.',
                'ศ.',
                'ส.',
              ];
              final englishDayNames = [
                'Sun',
                'Mon',
                'Tue',
                'Wed',
                'Thu',
                'Fri',
                'Sat',
              ];
              return Center(
                child: Text(
                  (language == 'th')
                      ? thaiDayNames[day.weekday - 1]
                      : englishDayNames[day.weekday - 1],
                  style: TextStyle(color: Colors.black),
                ),
              );
            },
            // Customize the day cell to show a purple circle around the selected day
            selectedBuilder: (context, date, events) {
              print("_calendarFormat => $_selectedDay");
              return Container(
                margin: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Colors.purple[100],
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${date.day}',
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
