import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1565C0)),
  scaffoldBackgroundColor: const Color.fromARGB(255, 231, 231, 231),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: Colors.black87,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      color: Colors.black87,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      color: Colors.black87,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
    headlineLarge: TextStyle(
      color: Colors.black87,
      fontSize: 32,
      fontWeight: FontWeight.w500,
    ),
    headlineMedium: TextStyle(
      color: Colors.black87,
      fontSize: 28,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.black87,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    ),
    labelMedium: TextStyle(
      color: Colors.black87,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: TextStyle(
      color: Colors.black87,
      fontSize: 12,
      fontWeight: FontWeight.w700,
    ),
  ),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black87, size: 30),
  ),
  dividerTheme: DividerThemeData(color: Colors.black12),
);
