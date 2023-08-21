import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'delete_thread_dialog.dart';
import 'more_menu_bottom_sheet.dart';
import '../models/more_menu.dart';
import '../routes/app_pages.dart';
import '../models/thread.dart';
import '../../common/min_icons_icons.dart';
import '../../const/colors.dart';

class MultiThreadCard extends StatelessWidget {
  const MultiThreadCard({
    super.key,
    required this.threads,
  });

  final List<ThreadModel> threads;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(
            color: ColorStyles.line01,
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          for (ThreadModel thread in threads.sublist(0, min(threads.length, 2)))
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.THREAD(id: thread.id));
              },
              child: _ThreadCard(
                id: thread.id,
                emoji: thread.emoji,
                createdAt: thread.createdAt,
                content: thread.content,
              ),
            ),
          threads.length > 2
              ? SizedBox(
                  height: 20,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 14,
                        ),
                        child: Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            color: ColorStyles.sunset03,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.THREAD(id: threads[0].id));
                        },
                        child: const Text(
                          '엮인 글 더보기',
                          style: TextStyle(
                            color: ColorStyles.point01,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}

class _ThreadCard extends StatelessWidget {
  const _ThreadCard({
    required this.id,
    this.emoji,
    required this.createdAt,
    required this.content,
  });

  final int id;
  final String? emoji;
  final DateTime createdAt;
  final String content;

  @override
  Widget build(BuildContext context) {
    final seeMore = (content.length > 100).obs;

    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 16, bottom: 8),
          padding: const EdgeInsets.only(left: 26, bottom: 12),
          decoration: const BoxDecoration(
            border: BorderDirectional(
              start: BorderSide(
                color: ColorStyles.line01,
                width: 2,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('y년 M월 d일(E)', 'ko').format(createdAt),
                      style: const TextStyle(color: ColorStyles.sunset02),
                    ),
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: IconButton(
                        onPressed: () => Get.bottomSheet(
                          enableDrag: false,
                          MoreMenuBottomSheet(
                            menu: [
                              MoreMenuModel(
                                text: '엮인 글 쓰기',
                                onPressed: () => Get.toNamed(
                                    Routes.COMPOSE_SUB_THREAD(id: id)),
                              ),
                              MoreMenuModel(
                                text: '수정',
                                onPressed: () =>
                                    Get.toNamed(Routes.EDIT_THREAD(id: id)),
                              ),
                              MoreMenuModel(
                                text: '삭제',
                                onPressed: onDeleteThreadPressed,
                                color: ColorStyles.red01,
                              ),
                            ],
                          ),
                        ),
                        icon: const Icon(MinIcons.more_horiz),
                        iconSize: 16,
                        padding: const EdgeInsets.all(0),
                        color: ColorStyles.sunset02,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Obx(
                () => RichText(
                  text: TextSpan(
                    text: seeMore.value ? content.substring(0, 100) : content,
                    style: const TextStyle(color: ColorStyles.sunset01),
                    children: [
                      TextSpan(
                        text: seeMore.value ? '...더보기' : '',
                        style: const TextStyle(color: ColorStyles.sunset02),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            seeMore.value = false;
                          },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          width: 32,
          height: 40,
          padding: const EdgeInsets.only(bottom: 8),
          decoration: const BoxDecoration(color: ColorStyles.bg01),
          child: Center(
            child: emoji != null
                ? Text(
                    emoji!,
                    style: const TextStyle(fontSize: 24),
                  )
                : const Icon(
                    MinIcons.memo,
                    color: ColorStyles.sunset03,
                  ),
          ),
        ),
      ],
    );
  }

  void onDeleteThreadPressed() {
    Get.back();
    Get.dialog(
      DeleteThreadDialog(id: id),
      useSafeArea: true,
    );
  }
}
