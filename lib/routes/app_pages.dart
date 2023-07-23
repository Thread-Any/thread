import 'package:get/get.dart';
import 'package:thread/pages/setting/bindings/setting_binding.dart';
import 'package:thread/pages/setting/screens/setting_screen.dart';

import '../pages/calendar/bindings/calendar_binding.dart';
import '../pages/calendar/screens/calendar_screen.dart';
import '../pages/threads/bindings/threads_binding.dart';
import '../pages/threads/screens/threads_screen.dart';
import '../pages/search/bindings/search_binding.dart';
import '../pages/search/screens/search_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.threads;

  static final routes = [
    GetPage(
      name: _Paths.threads,
      page: () => const ThreadsScreen(),
      binding: ThreadsBind(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.search,
      page: () => const SearchScreen(),
      binding: SearchBind(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.calendar,
      page: () => const CalendarScreen(),
      binding: CalendarBind(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.setting,
      page: () => const SettingScreen(),
      binding: SettingBind(),
      transition: Transition.fadeIn,
    ),
  ];
}
