// ignore_for_file: prefer-match-file-name

import 'package:flutter/widgets.dart';
import 'package:octopus/src/core/localization/app_localization.dart';

extension LocalizationX on BuildContext {
  GeneratedLocalization stringOf() =>
      AppLocalization.stringOf<GeneratedLocalization>(this);
}
