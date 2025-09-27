import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/widgets.dart' show BuildContext;

extension EmailFieldModelValidationErrorEmpl
    on EmailFieldModelValidationError? {
  String? value(BuildContext context) {
    switch (this) {
      case EmailFieldModelValidationError.empty:
        return context.l10n.fieldCannotBeEmpty;
      case EmailFieldModelValidationError.invalidLength:
        return '${context.l10n.email} ${context.l10n.tooShort(6)}';
      case EmailFieldModelValidationError.wrong:
        return '${context.l10n.email} ${context.l10n.isWrongEmail}';
      case null:
        return null;
    }
  }
}

extension PasswordFieldModelValidationErrorEmpl
    on PasswordFieldModelValidationError? {
  String? value(BuildContext context) {
    switch (this) {
      case PasswordFieldModelValidationError.empty:
        return context.l10n.fieldCannotBeEmpty;
      case PasswordFieldModelValidationError.invalidLength:
        return '${context.l10n.password} '
            '${context.l10n.tooShort(8)}';
      case null:
        return null;
      case PasswordFieldModelValidationError.capitalLetter:
        return '${context.l10n.password} '
            '${context.l10n.capitalLetter}';
      case PasswordFieldModelValidationError.oneNumber:
        return '${context.l10n.password} '
            '${context.l10n.oneNumber}';
      case PasswordFieldModelValidationError.onlyEnglishLetter:
        return '${context.l10n.password} '
            '${context.l10n.onlyEnglishLetter}';
    }
  }
}

extension MessageFieldModelValidationErrorEmpl
    on MessageFieldModelValidationError? {
  String? value(BuildContext context) {
    switch (this) {
      case MessageFieldModelValidationError.empty:
        return context.l10n.fieldCannotBeEmpty;
      case null:
        return null;
    }
  }
}
