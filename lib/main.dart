import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:thread/const/colors.dart';

import '../routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
  );
  initializeDateFormatting('ko');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thread',
      theme: ThemeData(
        fontFamily: "Min Sans",
        useMaterial3: true,
        textTheme: const TextTheme(
          bodySmall: TextStyle(
            color: ColorStyles.sunset02,
          ),
          bodyMedium: TextStyle(
            color: ColorStyles.sunset01,
          ),
          bodyLarge: TextStyle(
            color: ColorStyles.sunset00,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorStyles.sunset01,
          primary: ColorStyles.sunset01,
          secondary: ColorStyles.sunset01,
        ),
      ),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
