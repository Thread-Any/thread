import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/colors.dart';

class ThreadMoreBottomSheet extends StatelessWidget {
  const ThreadMoreBottomSheet({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 276,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 33),
        color: Colors.transparent,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 164,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: ColorStyles.sunset02,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: ColorStyles.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: () {
                      // TODO: 엮인글쓰기 기능 구현하기
                    },
                    child: const Text(
                      '엮인 글 쓰기',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: ColorStyles.sunset01,
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        border: Border.symmetric(
                      horizontal: BorderSide(
                        color: ColorStyles.line01,
                        width: 1,
                      ),
                    )),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: ColorStyles.sunset02,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: ColorStyles.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.zero),
                        ),
                      ),
                      onPressed: () {
                        // TODO: 수정 기능 구현하기
                      },
                      child: const Text(
                        '수정',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: ColorStyles.sunset01,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: ColorStyles.sunset02,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: ColorStyles.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: () {
                      // TODO: 삭제 기능 구현하기
                    },
                    child: const Text(
                      '삭제',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: ColorStyles.red01,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: ColorStyles.sunset02,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: ColorStyles.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  '취소',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: ColorStyles.sunset01,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
