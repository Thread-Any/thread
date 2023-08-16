import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/setting_controller.dart';
import '../../../common/min_icons_icons.dart';
import '../../../const/colors.dart';
import '../../../routes/app_pages.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Get.offNamed(Routes.threads),
                  icon: const Icon(MinIcons.close),
                ),
                const Text(
                  '설정',
                ),
              ],
            ),
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: ColorStyles.black,
      ),
    );
  }
}
