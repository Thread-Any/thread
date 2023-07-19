import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/composer_bottom_sheet.dart';
import '../../common/min_icons_icons.dart';
import '../../const/colors.dart';
import '../../routes/app_pages.dart';

class CommonBottomNavigationBar extends StatelessWidget {
  const CommonBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = Get.currentRoute;
    var currentIndex = 0;

    if (currentRoute.startsWith(Routes.search) == true) {
      currentIndex = 2;
    }

    return SafeArea(
      child: SizedBox(
        height: 76,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              highlightColor: Colors.transparent,
              onPressed: () {
                Get.toNamed(Routes.threads);
              },
              icon: currentIndex == 0
                  ? Icon(
                      MinIcons.home3,
                      size: 28,
                      color: colors['UI01'],
                    )
                  : Icon(
                      MinIcons.home2,
                      size: 28,
                      color: colors['UI03'],
                    ),
            ),
            IconButton(
              highlightColor: Colors.transparent,
              onPressed: () {
                Get.bottomSheet(
                  ignoreSafeArea: false,
                  isScrollControlled: true,
                  const ComposerBottomSheet(),
                );
              },
              icon: Container(
                width: 52,
                height: 52,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x33000000),
                      offset: Offset(0, 2),
                      blurRadius: 8,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: colors['UI01'],
                  child: const Icon(
                    MinIcons.add,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ),
            IconButton(
              highlightColor: Colors.transparent,
              onPressed: () {
                Get.toNamed(Routes.search);
              },
              icon: currentIndex == 2
                  ? Icon(
                      MinIcons.search2,
                      size: 28,
                      color: colors['UI01'],
                    )
                  : Icon(
                      MinIcons.search,
                      size: 28,
                      color: colors['UI03'],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
