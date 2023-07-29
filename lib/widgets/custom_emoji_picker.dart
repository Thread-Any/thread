import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';

class CustomEmojiPicker extends StatelessWidget {
  const CustomEmojiPicker({
    super.key,
    this.onEmojiSelected,
    this.textEditingController,
  });

  final OnEmojiSelected? onEmojiSelected;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return EmojiPicker(
      config: const Config(
        iconColor: ColorStyles.sunset03,
        iconColorSelected: ColorStyles.sunset02,
        indicatorColor: ColorStyles.sunset02,
        bgColor: ColorStyles.bg01,
      ),
      onEmojiSelected: onEmojiSelected,
      textEditingController: textEditingController,
    );
  }
}
