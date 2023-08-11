import 'package:flutter/material.dart' hide BottomNavigationBar;
import 'package:get/get.dart';

import '../../../widgets/bottom_navigation_bar.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const Scaffold(
        body: SafeArea(
          child: Text(
            '검색',
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(),
      ),
    );
  }
}
