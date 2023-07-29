import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:get/get.dart';

class ComposeController extends GetxController {
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
  final showTitle = true.obs;
  final emoji = ''.obs;

  void changeShowTitle() {
    showTitle.value = !showTitle.value;
  }

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

  void changeEmoji({required Emoji newEmoji}) {
    emoji.value = newEmoji.emoji;
  }
}
