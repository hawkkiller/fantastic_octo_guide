import 'package:flutter/material.dart';
import 'package:octopus/src/core/utils/extensions/context_extension.dart';
import 'package:octopus/src/core/widget/theme_scope.dart';

/// {@template sample_page}
/// SamplePage widget
/// {@endtemplate}
class SampleScreen extends StatefulWidget {
  /// {@macro sample_page}
  const SampleScreen({super.key});

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          title: Text(context.stringOf().appTitle),
        ),
        body: Center(
          child: FilledButton.tonal(
            onPressed: () {
              final microseconds = DateTime.now().microsecondsSinceEpoch;
              // get random color
              final random = microseconds % 256;

              final random2 = microseconds * 20132 % 256;

              final random3 = microseconds * 123 % 256;
              final color = Color.fromRGBO(random, random2, random3, 1);

              ThemeScope.of(context).setSeed(color);
            },
            child: Text(context.stringOf().change_theme),
          ),
        ),
      );
}
