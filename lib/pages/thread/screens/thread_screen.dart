import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart' hide BottomNavigationBar;
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/thread_controller.dart';
import '../../../common/min_icons_icons.dart';
import '../../../const/colors.dart';
import '../../../models/more_menu.dart';
import '../../../widgets/more_menu_bottom_sheet.dart';
import '../../../widgets/custom_emoji_picker.dart';

class ThreadScreen extends GetView<ThreadController> {
  const ThreadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Get.bottomSheet(
                  CustomEmojiPicker(
                    onEmojiSelected: (Category? category, Emoji newEmoji) {
                      controller.changeEmoji(newEmoji: newEmoji);
                      Get.back();
                    },
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: (controller.emoji.isNotEmpty)
                      ? SizedBox(
                          width: 32,
                          height: 32,
                          child: Center(
                            child: Text(
                              controller.emoji.value,
                              style: const TextStyle(
                                fontSize: 32,
                                height: 1,
                              ),
                            ),
                          ),
                        )
                      : const Icon(
                          MinIcons.face_add,
                          color: ColorStyles.sunset03,
                          size: 32,
                        ),
                ),
              ),
              const SizedBox(
                height: 20,
                width: double.infinity,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.only(top: 12),
                child: Text(
                  DateFormat('y년 M월 d일(E)', 'ko')
                      .format(controller.createdAt.value),
                  style: const TextStyle(
                    fontSize: 12,
                    color: ColorStyles.sunset02,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.only(top: 8),
                child: Offstage(
                  offstage: controller.title.isEmpty,
                  child: Text(
                    controller.title.value,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: ColorStyles.sunset01,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
                width: double.infinity,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    controller.content.value,
                    style: const TextStyle(
                      fontSize: 17,
                      color: ColorStyles.sunset01,
                    ),
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                width: double.infinity,
                height: 42,
                decoration: const BoxDecoration(
                  color: ColorStyles.bg03,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: const Text(
                  '엮인 글 쓰기',
                  style: TextStyle(
                    fontSize: 17,
                    color: ColorStyles.sunset02,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          highlightColor: Colors.transparent,
          hoverColor: ColorStyles.transparent,
          onPressed: () {
            Get.back();
          },
          icon: const Icon(MinIcons.arrow_left),
          iconSize: 24,
          color: ColorStyles.sunset01,
        ),
        actions: [
          IconButton(
            onPressed: () => Get.bottomSheet(
              enableDrag: false,
              MoreMenuBottomSheet(
                menu: [
                  MoreMenuModel(
                    text: '수정',
                    onPressed: () {},
                  ),
                  MoreMenuModel(
                    text: '삭제',
                    onPressed: () {},
                    color: ColorStyles.red01,
                  ),
                ],
              ),
            ),
            icon: const Icon(MinIcons.more_horiz),
            iconSize: 24,
            color: ColorStyles.sunset01,
          ),
        ],
        toolbarHeight: 56,
        foregroundColor: ColorStyles.sunset01,
        surfaceTintColor: ColorStyles.transparent,
        backgroundColor: ColorStyles.bg01,
      ),
      backgroundColor: ColorStyles.bg01,
    );
  }
}
