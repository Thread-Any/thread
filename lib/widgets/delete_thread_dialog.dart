import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/colors.dart';
import '../routes/app_pages.dart';

class DeleteThreadDialog extends StatelessWidget {
  const DeleteThreadDialog({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 295,
        height: 173,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: ColorStyles.bg01,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  Text(
                    "정말 글을 삭제할까요?",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: ColorStyles.sunset01),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "삭제된 글은 복구가 불가능합니다.",
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorStyles.sunset02,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                      backgroundColor: ColorStyles.transparent,
                      shadowColor: ColorStyles.transparent,
                      surfaceTintColor: ColorStyles.transparent,
                      foregroundColor: ColorStyles.white,
                    ),
                    child: const Text(
                      '취소',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: ColorStyles.sunset01,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  fit: FlexFit.tight,
                  child: ElevatedButton(
                    onPressed: onConfirmPressed,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                      backgroundColor: ColorStyles.sunset01,
                      shadowColor: ColorStyles.transparent,
                      surfaceTintColor: ColorStyles.sunset01,
                      foregroundColor: ColorStyles.white,
                    ),
                    child: const Text(
                      '삭제하기',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void onConfirmPressed() {
    // TODO: thread 삭제
    Get.back();
    if (Get.currentRoute.startsWith('${Routes.threads}/')) {
      Get.offNamed(Routes.threads);
    }

    Get.snackbar(
      '',
      '',
      overlayColor: Colors.transparent,
      backgroundColor: ColorStyles.sunset01,
      titleText: Container(),
      messageText: const Center(
        child: Text(
          '삭제되었습니다.',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
