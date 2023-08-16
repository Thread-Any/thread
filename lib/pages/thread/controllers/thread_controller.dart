import 'dart:async';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:get/get.dart';

class ThreadController extends GetxController {
  ThreadController({
    required this.id,
  });

  final int id;
  final createdAt = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  ).obs;
  final emoji = ''.obs;
  final title = ''.obs;
  final content = ''.obs;

  @override
  void onInit() {
    super.onInit();

    print('아이디: $id');
    // TODO: 데이터 조회

    Timer(const Duration(seconds: 1), () {
      createdAt.value = DateTime.utc(2022, 03, 12);
      emoji.value = '🌙';
      title.value = '완벽하게 사랑하는 너에게';
      content.value =
          '좀 살아보니 알겠는 건 \n그냥 하루 세 끼를 함께 챙겨 먹는 주말이 있고\n함께 잠들 수 있는 집이 있다는 게\n그렇게 평범하게 사는 것도\n쉬운 게 아니라는 것';
    });
  }

  void changeEmoji({required Emoji newEmoji}) {
    emoji.value = newEmoji.emoji;
    // TODO: 데이터 업데이트
  }
}
