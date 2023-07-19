import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComposerBottomSheet extends StatelessWidget {
  const ComposerBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const Text(
              'BottomSheet',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('닫기'),
            ),
          ],
        ),
      ),
    );
  }
}
