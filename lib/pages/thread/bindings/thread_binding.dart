import 'package:get/get.dart';

import '../controllers/thread_controller.dart';

class ThreadBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThreadController>(
      () => ThreadController(
        id: int.parse(Get.parameters['id']!),
      ),
    );
  }
}
