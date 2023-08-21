import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'more_menu_bottom_sheet.dart';
import '../routes/app_pages.dart';
import '../models/more_menu.dart';
import '../widgets/delete_thread_dialog.dart';
import '../../common/min_icons_icons.dart';
import '../../const/colors.dart';

class SingleThreadCard extends StatelessWidget {
  const SingleThreadCard({
    super.key,
    required this.id,
    this.icon,
    required this.createdAt,
    required this.content,
  });

  final int id;
  final String? icon;
  final DateTime createdAt;
  final String content;

  @override
  Widget build(BuildContext context) {
    final seeMore = (content.length > 100).obs;

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
      child: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.THREAD(id: id));
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: Center(
                child: icon != null
                    ? Text(
                        icon!,
                        style: const TextStyle(fontSize: 24),
                      )
                    : const Icon(
                        MinIcons.memo,
                        color: ColorStyles.sunset03,
                      ),
              ),
            ),
            const SizedBox(width: 12),
            Flexible(
              fit: FlexFit.tight,
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
                        text:
                            seeMore.value ? content.substring(0, 100) : content,
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
          ],
        ),
      ),
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
