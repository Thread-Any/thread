import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:thread/common/min_icons_icons.dart';
import 'package:thread/const/colors.dart';
import 'package:thread/routes/app_pages.dart';

import '../controllers/setting_controller.dart';

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
