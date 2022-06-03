import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Colors.white,
    onPrimary: Colors.black,
    secondary: Color(0xFF2350A3),
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    background: Color(0xFFDAE0E6),
    onBackground: Colors.black,
    surface: Colors.black,
    onSurface: Colors.black,
  ));
}
