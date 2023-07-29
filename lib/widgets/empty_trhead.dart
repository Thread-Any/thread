import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thread/routes/app_pages.dart';

import '../const/colors.dart';

class EmptyThread extends StatelessWidget {
  const EmptyThread({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ColorStyles.bg01,
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 84),
        child: Column(
          children: [
            const Text(
              '작성된 글이 없어요.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '스레드에서 글을 작성해보세요.',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: ColorStyles.sunset02,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.compose);
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
                backgroundColor: ColorStyles.bg03,
                shadowColor: ColorStyles.transparent,
                surfaceTintColor: ColorStyles.bg03,
              ),
              child: const Text(
                '글 작성하기',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
