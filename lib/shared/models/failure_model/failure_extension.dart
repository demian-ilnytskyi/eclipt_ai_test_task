import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart' show BuildContext;

extension SomeFailureValue on SomeFailure {
  String? value(BuildContext context) {
    switch (this) {
      case SomeFailure.setExistData:
      case SomeFailure.serverError:
      case SomeFailure.noSuchMethodError:
        return context.l10n.unkownError;
      case SomeFailure.timeout:
        return context.l10n.timeoutFailure;
      case SomeFailure.type:
        return context.l10n.typeFailure;
      case SomeFailure.assertion:
        return context.l10n.assertionFailure;
      case SomeFailure.unimplementedFeature:
        return context.l10n.unimplementedFeatureFailure;
      case SomeFailure.format:
        return context.l10n.formatFailure;
      case SomeFailure.get:
        return context.l10n.getFailure;
      case SomeFailure.send:
        return context.l10n.sendFailure;
      case SomeFailure.network:
        return context.l10n.networkFailure;
      case SomeFailure.maxRetries:
        return context.l10n.maxRetriesFailure;
      case SomeFailure.loadFileCancel:
        return context.l10n.loadFileCancelFailure;
      case SomeFailure.cancelled:
        return context.l10n.cancelledFailure;
      case SomeFailure.fcm:
        return context.l10n.fcmFailure;
      case SomeFailure.unauthorized:
        return context.l10n.unauthorizedFailure;
      case SomeFailure.userNotFound:
        return context.l10n.userNotFoundFailure;
      case SomeFailure.userDuplicate:
        return context.l10n.userDuplicateFailure;
      case SomeFailure.requiresRecentLogin:
        return context.l10n.requiresRecentLoginFailure;
      case SomeFailure.userEmailDuplicate:
        return context.l10n.userEmailDuplicateFailure;
      case SomeFailure.tooManyRequests:
        return context.l10n.tooManyRequestsFailure;
      case SomeFailure.permission:
        return context.l10n.permissionFailure;
      case SomeFailure.emailSendingFailed:
        return context.l10n.emailSendingFailedFailure;
      case SomeFailure.wrongVerifyCode:
        return context.l10n.wrongVerifyCodeFailure;
      case SomeFailure.invalidInput:
        return context.l10n.invalidInputFailure;
      case SomeFailure.emailInvalidFormat:
        return context.l10n.emailInvalidFormatFailure;
      case SomeFailure.passwordWrong:
        return context.l10n.passwordWrongFailure;
      case SomeFailure.passwordWeak:
        return context.l10n.passwordWeakFailure;
      case SomeFailure.userDisable:
        return context.l10n.userDisableFailure;
      case SomeFailure.dataNotFound:
        return context.l10n.dataNotFoundFailure;
      case SomeFailure.wrongID:
        return context.l10n.wrongIDFailure;
      case SomeFailure.linkWrong:
        return context.l10n.linkWrongFailure;
      case SomeFailure.providerAlreadyLinked:
      case SomeFailure.serviceWorkerRegistration:
      case SomeFailure.popupCancelled:
        return null;
      case SomeFailure.unsupported:
        return context.l10n.unsupportedError;
    }
  }
}
