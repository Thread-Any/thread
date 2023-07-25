import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class ThreadsController extends GetxController {
  final selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  ).obs;
  final focusedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  ).obs;
  final calendarFormat = CalendarFormat.week.obs;

  void changeSelectedDate({required DateTime day}) {
    selectedDate.value = day;
  }

  void changeFocusedDate({required DateTime focusedDay}) {
    focusedDate.value = DateTime.utc(
      focusedDay.year,
      focusedDay.month,
      focusedDay.day,
    );
  }

  void changeCalendarFormat(bool isWeek) {
    calendarFormat.value = isWeek ? CalendarFormat.month : CalendarFormat.week;
  }
}
