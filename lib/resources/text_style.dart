import 'package:flutter/material.dart';

class TextStyleRegular extends TextStyle {
  @override
  final Color color;
  @override
  final double fontSize;

  const TextStyleRegular({required this.color, required this.fontSize})
      : super(
        color: color,
        fontSize: fontSize,
        fontFamily: "Inter"
      );
}

class TextStyleMedium extends TextStyle {
  @override
  final Color color;
  @override
  final double fontSize;

  const TextStyleMedium({required this.color,  required this.fontSize})
      : super(
        color: color, 
        fontSize: fontSize,
        fontFamily: "Inter-Medium",
        fontWeight: FontWeight.w500
      );
}

class TextStyleBold extends TextStyle {
  @override
  final Color color;
  @override
  final double fontSize;

  const TextStyleBold({required this.color, required this.fontSize})
      : super(
        color: color, 
        fontSize: fontSize,
        fontFamily: "Inter-Bold",
        fontWeight: FontWeight.w600
      );
}
