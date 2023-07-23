import 'package:get/get.dart';

import '../controllers/calendar_controller.dart';

class CalendarBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalendarController>(() => CalendarController());
  }
}
