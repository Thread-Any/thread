import 'package:get/get.dart';

import '../controllers/search_controller.dart';

class SearchBind extends Bindings {
  @override
  void dependencies() {
    return Get.lazyPut<SearchController>(() => SearchController());
  }
}
