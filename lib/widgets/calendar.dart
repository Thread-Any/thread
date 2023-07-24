import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../const/colors.dart';

class Calendar extends StatelessWidget {
  const Calendar({
    super.key,
    required this.focusedDay,
    required this.selectedDay,
    this.calendarFormat = CalendarFormat.week,
    this.eventLoader,
    required this.onDaySelected,
    this.onPageChanged,
  });

  final DateTime focusedDay;
  final DateTime selectedDay;
  final CalendarFormat calendarFormat;
  final List<dynamic> Function(DateTime day)? eventLoader;
  final OnDaySelected onDaySelected;
  final void Function(DateTime focusedDay)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    return TableCalendar(
      locale: 'ko_kr',
      focusedDay: focusedDay,
      firstDay: DateTime(1900, 1, 1),
      lastDay: DateTime(today.year, today.month, today.day),
      onDaySelected: onDaySelected,
      onPageChanged: onPageChanged,
      selectedDayPredicate: (day) =>
          day.year == selectedDay.year &&
          day.month == selectedDay.month &&
          day.day == selectedDay.day,
      eventLoader: eventLoader,
      headerVisible: false,
      calendarFormat: calendarFormat,
      daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: ColorStyles.sunset02,
          ),
          weekendStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: ColorStyles.sunset02,
          )),
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        markerSizeScale: 0.12,
        markersAnchor: 1.7,
        markerDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: ColorStyles.point01,
        ),
        todayDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        selectedTextStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 15,
          color: ColorStyles.white,
        ),
        selectedDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorStyles.sunset01,
        ),
        outsideTextStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          color: ColorStyles.sunset03,
        ),
        outsideDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        disabledTextStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          color: ColorStyles.sunset03,
        ),
        disabledDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        // holidayTextStyle: const TextStyle(
        //   color: ColorStyles.red01,
        // ),
        holidayDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        weekendTextStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          color: ColorStyles.sunset02,
        ),
        weekendDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        defaultTextStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          color: ColorStyles.sunset01,
        ),
        defaultDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        cellMargin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        tablePadding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      ),
    );
  }
}
