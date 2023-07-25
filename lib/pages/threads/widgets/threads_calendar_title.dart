import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/threads_controller.dart';
import '../../../common/min_icons_icons.dart';
import '../../../const/colors.dart';
import '../../../routes/app_pages.dart';

class ThreadsCalendarTitle extends GetView<ThreadsController> {
  const ThreadsCalendarTitle({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Obx(() => Text(
                  DateFormat('y년 M월', 'ko')
                      .format(controller.focusedDate.value),
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 21,
                  ),
                )),
            const SizedBox(
              width: 8,
            ),
            const SizedBox(
              width: 12,
              height: 24,
              child: Icon(MinIcons.arrow_drop_down),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => Get.toNamed('${Routes.threads}?viewMode=list'),
              icon: const Icon(
                MinIcons.list,
                color: ColorStyles.sunset01,
              ),
            ),
            IconButton(
              onPressed: () => Get.toNamed(Routes.setting),
              icon: const Icon(
                MinIcons.setting,
                color: ColorStyles.sunset01,
              ),
            )
          ],
        ),
      ],
    );
  }
}
