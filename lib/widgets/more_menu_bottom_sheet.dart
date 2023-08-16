import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/colors.dart';
import '../models/more_menu.dart';

class MoreMenuBottomSheet extends StatelessWidget {
  const MoreMenuBottomSheet({
    super.key,
    required this.menu,
  });

  final List<MoreMenuModel> menu;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: (55 * (menu.length + 1)).toDouble() + 11,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 33),
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: double.infinity,
              height: (55 * menu.length).toDouble() - 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: menu.asMap().entries.map((entry) {
                  int idx = entry.key;
                  MoreMenuModel item = entry.value;

                  if (idx == 0) {
                    return TextButton(
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
                      onPressed: item.onPressed,
                      child: Text(
                        item.text,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: item.color ?? ColorStyles.sunset01,
                        ),
                      ),
                    );
                  }

                  return Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: ColorStyles.line01,
                          width: 1,
                        ),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: ColorStyles.sunset02,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: ColorStyles.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: (idx == menu.length - 1)
                              ? const BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                )
                              : const BorderRadius.all(Radius.zero),
                        ),
                      ),
                      onPressed: item.onPressed,
                      child: Text(
                        item.text,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: item.color ?? ColorStyles.sunset01,
                        ),
                      ),
                    ),
                  );
                }).toList(),
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
