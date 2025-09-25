import 'package:exlipt_ai_test_task/l10n/generated/app_localizations.g.dart';
import 'package:flutter/widgets.dart';

/// COMMENT: Adds localization in App

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

const locale = AppLocalizations.localizationsDelegates;
const supportedLocales = AppLocalizations.supportedLocales;
