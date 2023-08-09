import 'dart:ui';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:octopus/src/core/utils/logger.dart';
import 'package:octopus/src/feature/app/widget/app.dart';

/// A class which is responsible for initialization and running the app.
class AppRunner {
  /// run initialization
  ///
  /// if success -> run app
  Future<void> initializeAndRun() async {
    final bindings = WidgetsFlutterBinding.ensureInitialized()
      ..deferFirstFrame();
    FlutterError.onError = logger.logFlutterError;
    PlatformDispatcher.instance.onError = logger.logPlatformDispatcherError;
    Bloc.transformer = sequential();

    bindings.addPostFrameCallback((_) {
      bindings.allowFirstFrame();
    });
    // Run application
    const App().run();
  }
}
