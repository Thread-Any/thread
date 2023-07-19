import 'package:get/get.dart';

import '../controllers/threads_controller.dart';

class ThreadsBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThreadsController>(() => ThreadsController());
  }
}
