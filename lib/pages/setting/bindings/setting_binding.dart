import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingBind extends Bindings {
  @override
  void dependencies() {
    return Get.lazyPut<SettingController>(() => SettingController());
  }
}
