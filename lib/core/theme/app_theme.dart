import 'package:flutter/material.dart';

ThemeData lightTheme() => ThemeData(
  useMaterial3: true,
  colorSchemeSeed: const Color(0xFF0B66C3),
  brightness: Brightness.light,
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  ),
);

ThemeData darkTheme() => ThemeData(
  useMaterial3: true,
  colorSchemeSeed: const Color(0xFF7FB3FF),
  brightness: Brightness.dark,
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  ),
);
