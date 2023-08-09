import 'package:flutter/material.dart';
import 'package:octopus/src/core/localization/app_localization.dart';
import 'package:octopus/src/core/widget/theme_scope.dart';
import 'package:octopus/src/feature/sample/widget/sample_screen.dart';

/// A widget which is responsible for providing the app context.
class AppContext extends StatefulWidget {
  const AppContext({super.key});

  @override
  State<AppContext> createState() => _AppContextState();
}

class _AppContextState extends State<AppContext> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        supportedLocales: AppLocalization.supportedLocales,
        localizationsDelegates: AppLocalization.localizationsDelegates,
        theme: ThemeScope.of(context).lightThemeData,
        darkTheme: ThemeScope.of(context).darkThemeData,
        locale: const Locale('en'),
        home: const SampleScreen(),
      );
}
