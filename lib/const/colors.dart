import 'package:flutter/material.dart';

const grey = <int, Color>{
  10: Color(0xFFF1F1F2),
  20: Color(0xFFE3E3E5),
  30: Color(0xFFC8C8CC),
  40: Color(0xFFA0A0A5),
  50: Color(0xFF7C7C80),
  60: Color(0xFF555559),
  70: Color(0xFF3D3D40),
  80: Color(0xFF242426),
  90: Color(0xFF181819),
};

const orange = <int, Color>{
  10: Color(0xFFFFF8F6),
  50: Color(0xFFF9851B),
  90: Color(0xFF331900),
};

final colors = {
  'UI00': grey[90],
  'UI01': grey[70],
  'UI02': grey[50],
  'UI03': grey[30],
  'UI04': grey[20],
  'UI05': grey[10],
  'UI06': Colors.white,
  'UI07': Colors.black,
  'TRANSPARENT': Colors.transparent,
  'SOLID_TEXT': Colors.white,
  'LINE01': grey[20],
  'LINE02': grey[40],
  'BG01': Colors.white,
  'BG02': Colors.white,
  'BG03': grey[10],
  'POINT01': orange[50],
  'POINT02': orange[10],
};
