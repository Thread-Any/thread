import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/threads_controller.dart';
import '../../../widgets/common_bottom_navigation_bar.dart';

class ThreadsScreen extends GetView<ThreadsController> {
  const ThreadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Text(
          '메인',
        ),
      ),
      bottomNavigationBar: CommonBottomNavigationBar(),
    );
  }
}
