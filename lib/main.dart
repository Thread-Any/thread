import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
  );

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
      ),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
