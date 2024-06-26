import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:get/get.dart';

class ComposeController extends GetxController {
  final selectedDate = DateTime.utc(
          DateTime.now().year, DateTime.now().month, DateTime.now().day)
      .obs;
  final focusedDate = DateTime.utc(
          DateTime.now().year, DateTime.now().month, DateTime.now().day)
      .obs;
  final showTitle = true.obs;
  final emoji = ''.obs;
  final title = ''.obs;
  final content = ''.obs;

  @override
  void onInit() {
    print('compose: ${Get.parameters['id']}');
    // TODO: 데이터 조회

    super.onInit();
  }

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

  void clear() {
    selectedDate.value = DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day);
    focusedDate.value = DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day);
    showTitle.value = true;
    emoji.value = '';
    title.value = '';
    content.value = '';
  }
}
