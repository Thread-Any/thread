import 'package:get/get.dart';

import '../controllers/compose_controller.dart';

class ComposeBind extends Bindings {
  @override
  void dependencies() {
    return Get.lazyPut<ComposeController>(() => ComposeController());
  }
}
