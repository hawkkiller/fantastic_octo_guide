import 'dart:async';

import 'package:octopus/src/core/utils/logger.dart';
import 'package:octopus/src/feature/app/logic/app_runner.dart';

void main() {
  logger.runLogging(
    () {
      runZonedGuarded(
        () => AppRunner().initializeAndRun(),
        logger.logZoneError,
      );
    },
    const LogOptions(),
  );
}
