import 'package:flutter/material.dart';

const $seedColor = Colors.blue;

final $lightThemeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: $seedColor,
  ),
  brightness: Brightness.light,
  useMaterial3: true,
);

final $darkThemeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: $seedColor,
    brightness: Brightness.dark,
  ),
  brightness: Brightness.dark,
  useMaterial3: true,
);
