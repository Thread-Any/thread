import 'package:get/get.dart';

import '../pages/compose/bindings/compose_binding.dart';
import '../pages/compose/screens/compose_screen.dart';
import '../pages/threads/bindings/threads_binding.dart';
import '../pages/threads/screens/threads_screen.dart';
import '../pages/thread/bindings/thread_binding.dart';
import '../pages/thread/screens/thread_screen.dart';
import '../pages/setting/bindings/setting_binding.dart';
import '../pages/setting/screens/setting_screen.dart';
import '../pages/search/bindings/search_binding.dart';
import '../pages/search/screens/search_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.threads;

  static final routes = [
    GetPage(
      name: _Paths.threads,
      page: () => const ThreadsScreen(),
      title: 'Threads',
      binding: ThreadsBind(),
      transition: Transition.fadeIn,
      children: [
        GetPage(
          name: _Paths.id,
          page: () => const ThreadScreen(),
          title: 'Thread',
          binding: ThreadBind(),
          transition: Transition.rightToLeftWithFade,
          children: [
            GetPage(
              name: _Paths.compose,
              page: () => ComposeScreen(),
              title: 'Compose Sub Thread',
              binding: ComposeBind(),
              showCupertinoParallax: false,
              transition: Transition.fade,
            )
          ],
        )
      ],
    ),
    GetPage(
      name: _Paths.compose,
      page: () => ComposeScreen(),
      title: 'Compose',
      binding: ComposeBind(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.search,
      page: () => const SearchScreen(),
      title: 'Search',
      binding: SearchBind(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.setting,
      page: () => const SettingScreen(),
      title: 'Setting',
      binding: SettingBind(),
      transition: Transition.fadeIn,
    ),
  ];
}
