import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/common_bottom_navigation_bar.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Text(
          '검색',
        ),
      ),
      bottomNavigationBar: CommonBottomNavigationBar(),
    );
  }
}
