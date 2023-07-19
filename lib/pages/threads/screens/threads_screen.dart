import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../const/colors.dart';
import '../../../widgets/composer_bottom_sheet.dart';
import '../controllers/threads_controller.dart';

class ThreadsScreen extends GetView<ThreadsController> {
  const ThreadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Text(
          '메인',
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: colors['UI01'],
        onTap: (value) {
          switch (value) {
            case 0:
              Get.toNamed(Routes.threads);
              break;
            case 1:
              Get.bottomSheet(
                ignoreSafeArea: false,
                isScrollControlled: true,
                const ComposerBottomSheet(),
              );
              break;
            case 2:
              Get.toNamed(Routes.search);
              break;
            default:
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Composer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
