// ignore_for_file: prefer-match-file-name

import 'package:flutter/material.dart';
import 'package:octopus/src/core/theme/theme.dart';
import 'package:octopus/src/core/utils/mixin/scope_mixin.dart';

/// {@template theme_controller}
/// A class which is responsible for managing the theme.
/// {@endtemplate}
abstract interface class ThemeController {
  /// Seed color
  Color get seedColor;

  /// Light theme data
  ThemeData get lightThemeData;

  /// Dark theme data
  ThemeData get darkThemeData;

  /// Set seed color
  void setSeed(Color seedColor);
}

/// {@template theme_scope}
/// Theme Scope
/// {@endtemplate}
class ThemeScope extends StatefulWidget {
  /// {@macro theme_scope}
  const ThemeScope({
    required this.child,
    super.key,
  });

  /// Child widget
  final Widget child;

  /// Get theme controller
  static ThemeController of(BuildContext context, {bool listen = true}) =>
      ScopeMixin.scopeOf<_ThemeInherited>(
        context,
        listen: listen,
      ).controller;

  @override
  State<ThemeScope> createState() => _ThemeScopeState();
}

class _ThemeScopeState extends State<ThemeScope> implements ThemeController {
  ThemeData _lightThemeData = $lightThemeData;

  ThemeData _darkThemeData = $darkThemeData;

  Color _seedColor = $seedColor;

  @override
  void setSeed(Color seedColor) {
    setState(() {
      _seedColor = seedColor;
      _lightThemeData = ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seedColor,
        ),
        brightness: Brightness.light,
        useMaterial3: true,
      );
      _darkThemeData = ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seedColor,
          brightness: Brightness.dark,
        ),
        brightness: Brightness.dark,
        useMaterial3: true,
      );
    });
  }

  @override
  ThemeData get darkThemeData => _darkThemeData;

  @override
  ThemeData get lightThemeData => _lightThemeData;

  @override
  Color get seedColor => _seedColor;

  @override
  Widget build(BuildContext context) => _ThemeInherited(
        controller: this,
        child: widget.child,
      );
}

class _ThemeInherited extends InheritedWidget {
  const _ThemeInherited({
    required super.child,
    required this.controller,
  });

  final ThemeController controller;

  @override
  bool updateShouldNotify(_ThemeInherited oldWidget) => true;
}
