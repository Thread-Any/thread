import 'package:flutter/material.dart';

class MoreMenuModel {
  final String text;
  final Function()? onPressed;
  final Color? color;

  MoreMenuModel({
    required this.text,
    required this.onPressed,
    this.color,
  });
}
