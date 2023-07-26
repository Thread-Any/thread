import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/threads_controller.dart';
import '../../../const/colors.dart';
import '../../../widgets/common_bottom_navigation_bar.dart';
import '../widgets/threads_calendar_view.dart';
import '../widgets/threads_title.dart';
import '../widgets/threads_list_view.dart';

class ThreadsScreen extends GetView<ThreadsController> {
  const ThreadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Obx(
          () => Stack(
            children: [
              Visibility(
                visible: !controller.isCalendarView.value,
                maintainAnimation: true,
                maintainState: true,
                child: AnimatedOpacity(
                  opacity: controller.isCalendarView.value ? 0 : 1,
                  duration: const Duration(milliseconds: 500),
                  child: const TreadsListView(),
                ),
              ),
              Visibility(
                visible: controller.isCalendarView.value,
                maintainAnimation: true,
                maintainState: true,
                child: AnimatedOpacity(
                  opacity: controller.isCalendarView.value ? 1 : 0,
                  duration: const Duration(milliseconds: 500),
                  child: const ThreadsCalendarView(),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 64,
          foregroundColor: ColorStyles.sunset01,
          surfaceTintColor: ColorStyles.transparent,
          title: const ThreadsTitle(),
          backgroundColor: ColorStyles.bg03,
        ),
        bottomNavigationBar: const CommonBottomNavigationBar(),
        backgroundColor: ColorStyles.bg01,
      ),
    );
  }
}
