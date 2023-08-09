import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/generated_localizations.dart';

typedef GeneratedLocalization = GeneratedLocalizations;

/// A class which is responsible for providing the localization.
///
/// [AppLocalization] is a wrapper around [GeneratedLocalizations].
class AppLocalization {
  /// All the supported locales
  ///
  /// SSOT - arb files
  static const supportedLocales = GeneratedLocalizations.supportedLocales;

  /// All the localizations delegates
  static const localizationsDelegates =
      GeneratedLocalizations.localizationsDelegates;

  AppLocalization._();

  /// Returns the localized strings for the given [context].
  static T stringOf<T>(BuildContext context) =>
      Localizations.of<T>(context, T) ?? (throw 'No localization found');

  /// Returns the current locale of the [context].
  static Locale? localeOf(BuildContext context) =>
      Localizations.localeOf(context);

  /// Loads the [locale].
  static Future<GeneratedLocalizations> load(Locale locale) =>
      GeneratedLocalizations.delegate.load(locale);
}
