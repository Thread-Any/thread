import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/min_icons_icons.dart';
import '../../../const/colors.dart';
import '../../../routes/app_pages.dart';

class ThreadsListViewTitle extends StatelessWidget {
  const ThreadsListViewTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          '스레드',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 21,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () =>
                  Get.toNamed('${Routes.threads}?viewMode=calendar'),
              icon: const Icon(
                MinIcons.date,
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
