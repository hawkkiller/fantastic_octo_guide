import 'package:flutter/material.dart';
import 'package:octopus/src/core/widget/scope_widgets.dart';
import 'package:octopus/src/core/widget/theme_scope.dart';
import 'package:octopus/src/feature/app/widget/app_context.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// {@template app}
/// A widget which is responsible for running the app.
/// {@endtemplate}
class App extends StatelessWidget {
  /// {@macro app}
  const App({
    super.key,
  });

  /// run application
  void run() => runApp(
        DefaultAssetBundle(
          bundle: SentryAssetBundle(),
          child: this,
        ),
      );

  @override
  Widget build(BuildContext context) => ScopesProvider(
        providers: [
          ScopeProvider(
            buildScope: (child) => ThemeScope(
              child: child,
            ),
          ),
        ],
        child: const AppContext(),
      );
}
