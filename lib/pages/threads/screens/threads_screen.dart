import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/threads_controller.dart';
import '../../../const/colors.dart';
import '../../../widgets/common_bottom_navigation_bar.dart';
import '../widgets/threads_calendar_title.dart';
import '../widgets/threads_calendar_view.dart';
import '../widgets/threads_list_title.dart';
import '../widgets/threads_list_view.dart';

class ThreadsScreen extends GetView<ThreadsController> {
  const ThreadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isCalendarView = (Get.parameters['viewMode'] ?? '') == 'calendar';

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: isCalendarView
            ? const ThreadsCalendarView()
            : const TreadsListView(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 64,
          foregroundColor: ColorStyles.sunset01,
          surfaceTintColor: ColorStyles.transparent,
          title: isCalendarView
              ? const ThreadsCalendarTitle()
              : const ThreadsListViewTitle(),
          backgroundColor: ColorStyles.bg03,
        ),
        bottomNavigationBar: const CommonBottomNavigationBar(),
        backgroundColor: ColorStyles.bg01,
      ),
    );
  }
}
