import 'package:flutter/material.dart';
import 'package:octopus/src/core/theme/theme.dart';
import 'package:octopus/src/core/utils/mixin/scope_mixin.dart';

abstract interface class ThemeController {
  Color get seedColor;

  ThemeData get lightThemeData;

  ThemeData get darkThemeData;

  void setSeed(Color seedColor);
}

class ThemeScope extends StatefulWidget {
  const ThemeScope({
    required this.child,
    super.key,
  });

  final Widget child;

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
