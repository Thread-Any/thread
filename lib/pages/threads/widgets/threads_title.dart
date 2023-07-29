import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/threads_controller.dart';
import '../../../common/min_icons_icons.dart';
import '../../../const/colors.dart';
import '../../../routes/app_pages.dart';

class ThreadsTitle extends GetView<ThreadsController> {
  const ThreadsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          controller.isCalendarView.value
              ? Row(
                  children: [
                    Text(
                      DateFormat('y년 M월', 'ko')
                          .format(controller.focusedDate.value),
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 21,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const SizedBox(
                      width: 12,
                      height: 24,
                      child: Icon(MinIcons.arrow_drop_down),
                    ),
                  ],
                )
              : const Text(
                  '스레드',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 21,
                  ),
                ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Offstage(
                offstage: controller.isCalendarView.value,
                child: AnimatedOpacity(
                  opacity: controller.isCalendarView.value ? 0 : 1,
                  duration: const Duration(milliseconds: 300),
                  child: IconButton(
                    onPressed: () => controller.changeView(),
                    icon: const Icon(
                      MinIcons.date,
                      color: ColorStyles.sunset01,
                    ),
                  ),
                ),
              ),
              Offstage(
                offstage: !controller.isCalendarView.value,
                child: AnimatedOpacity(
                  opacity: controller.isCalendarView.value ? 1 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: IconButton(
                    onPressed: () => controller.changeView(),
                    icon: const Icon(
                      MinIcons.list,
                      color: ColorStyles.sunset01,
                    ),
                  ),
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
      ),
    );
  }
}
