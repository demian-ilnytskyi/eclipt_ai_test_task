// import 'package:exlipt_ai_test_task/shared/constants/text/error_text.dart';
import 'package:exlipt_ai_test_task/shared/shared_dart.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/services.dart';

part 'exceptions.dart';
part 'some_failure_extension.dart';

enum SomeFailure with _Exception {
  serverError,
  noSuchMethodError,
  timeout,
  type,
  assertion,
  unimplementedFeature,
  format,
  get,
  send,
  network,
  maxRetries,
  loadFileCancel,
  cancelled,
  fcm,
  unauthorized,
  userNotFound,
  userDuplicate,
  requiresRecentLogin,
  userEmailDuplicate,
  tooManyRequests,
  permission,
  emailSendingFailed,
  wrongVerifyCode,
  invalidInput,
  popupCancelled,
  emailInvalidFormat,
  passwordWrong,
  passwordWeak,
  userDisable,
  dataNotFound,
  wrongID,
  linkWrong,
  providerAlreadyLinked,
  serviceWorkerRegistration,
  unsupported,
  // notFound,
  setExistData;

  factory SomeFailure.value({
    required Object error,
    StackTrace? stack,
    User? user,
    String? data,
    String? tag,
    String? tagKey,
    ErrorLevelEnum? errorLevel,
  }) {
    return _Exception.getException(
      error: error,
      stack: stack,
      data: data,
      tag: tag,
      tagKey: tagKey,
      user: user,
      errorLevel: errorLevel,
    );
  }

  String get _getValue => toString().replaceFirst('SomeFailure', '');
}
