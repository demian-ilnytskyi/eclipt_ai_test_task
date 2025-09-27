part of 'some_failure.dart';

/// COMMENT: Error handling classes
mixin _Exception {
  // static FailureRepository failureRepository
  //= GetIt.I.get<FailureRepository>();
  static void _send({
    required Object error,
    required StackTrace? stack,
    required User? user,
    required String? data,
    required String? tag,
    required String? tagKey,
    required String? tag2,
    required String? tag2Key,
    required ErrorLevelEnum errorLevel,
  }) {
    FailureRepository.onError(
      error: error,
      stack: stack,
      reason: null,
      information: null,
      errorLevel: errorLevel,
      tag: tag,
      tagKey: tagKey,
      data: data,
      tag2: tag2,
      tag2Key: tag2Key,
    );
  }

  static SomeFailure _getFromFirebasException({
    required firebase.FirebaseException error,
    required StackTrace? stack,
    required User? user,
    required String? data,
    required String? tag,
    required String? tagKey,
    required ErrorLevelEnum? errorLevel,
  }) {
    // final String tagValue;
    final String tagKeyValue;
    ErrorLevelEnum? errorLevelValue;
    final SomeFailure failure;
    switch (error) {
      case firebase.FirebaseAuthException _:

        /// Authentication Error Start---------
        /// -----------------------------------
        tagKeyValue = 'Firebase Authentication';
        switch (error.code) {
          case 'invalid-email':
          case 'missing-email':
            errorLevelValue = ErrorLevelEnum.info;
            failure = SomeFailure.emailInvalidFormat;
          case 'user-disabled':
            errorLevelValue = ErrorLevelEnum.info;
            failure = SomeFailure.userDisable;
          case 'user-not-found':
          case 'invalid-credential':
            errorLevelValue = ErrorLevelEnum.info;
            failure = SomeFailure.userNotFound;
          case 'wrong-password':
          case 'missing-password':
            errorLevelValue = ErrorLevelEnum.info;
            failure = SomeFailure.passwordWrong;
          case 'weak-password':
            errorLevelValue = ErrorLevelEnum.info;
            failure = SomeFailure.passwordWeak;
          case 'too-many-requests':
            errorLevelValue = ErrorLevelEnum.info;
            failure = SomeFailure.tooManyRequests;
          case 'credential-already-in-use':
          case 'account-exists-with-different-credential':
            errorLevelValue = ErrorLevelEnum.info;
            failure = SomeFailure.userDuplicate;
          case 'requires-recent-login':
            errorLevelValue = ErrorLevelEnum.warning;
            failure = SomeFailure.requiresRecentLogin;
          case 'email-already-in-use':
            errorLevelValue = ErrorLevelEnum.info;
            failure = SomeFailure.userEmailDuplicate;
          case 'user-token-expired':
          case 'invalid-user-token':
            errorLevelValue = ErrorLevelEnum.info;
            failure = SomeFailure.wrongVerifyCode;
          case 'network-request-failed':
            errorLevelValue = ErrorLevelEnum.info;
            failure = SomeFailure.network;
          case 'provider-already-linked':
          case 'popup-closed-by-user':
            errorLevelValue = ErrorLevelEnum.info;
            failure = SomeFailure.providerAlreadyLinked;
          case 'cancelled-popup-request':
            errorLevelValue = ErrorLevelEnum.info;
            failure = SomeFailure.popupCancelled;
          case 'internal-error':
          case 'permission-denied':
          default:
            errorLevelValue = null;
            failure = SomeFailure.serverError;
        }

      /// Authentication Error Finished---------
      /// --------------------------------------
      default:
        tagKeyValue = 'Firebase Failure';
        switch (error.code) {
          case 'not-found':
          case 'object-not-found':
          case 'bucket-not-found':
          case 'project-not-found':
            errorLevelValue = ErrorLevelEnum.info;
            failure = SomeFailure.dataNotFound;
          case 'already-exists':
            errorLevelValue = ErrorLevelEnum.info;
            failure = SomeFailure.setExistData;
          case 'resource-exhausted':
            errorLevelValue = ErrorLevelEnum.info;
            failure = SomeFailure.tooManyRequests;
          case 'unauthorized':
          case 'unauthenticated':
            errorLevelValue = ErrorLevelEnum.info;
            failure = SomeFailure.permission;
          case 'max-retries':
          case 'retry-limit-exceeded':
            errorLevelValue = ErrorLevelEnum.info;
            failure = SomeFailure.maxRetries;
          case 'write-cancelled':
            errorLevelValue = ErrorLevelEnum.info;
            failure = SomeFailure.loadFileCancel;
          case 'cancelled':
            errorLevelValue = ErrorLevelEnum.info;
            failure = SomeFailure.cancelled;
          case 'invalid-argument':
          case 'unregistered':
          case 'expired-token':
          case 'invalid-checksum':
          case 'internal':
          case 'quota-exceeded':
          case 'mismatched-credential':
          case 'invalid-registration-token':
          case 'message-rate-exceeded':
          case 'permission-denied':
            errorLevelValue = ErrorLevelEnum.info;
            failure = SomeFailure.fcm;
          case 'deadline-exceeded':
          case 'disconnected':
          case 'network-error':
          case 'unavailable':
          case 'failed-precondition':
            errorLevelValue = ErrorLevelEnum.info;
            failure = SomeFailure.network;
          case 'failed-service-worker-registration':
            errorLevelValue = ErrorLevelEnum.info;
            failure = SomeFailure.serviceWorkerRegistration;
          case 'unimplemented':
          case 'data-loss':
          case 'aborted':
          case 'unknown':
          case 'out-of-range':
          default:
            errorLevelValue = null;
            failure = SomeFailure.serverError;
        }
    }
    _send(
      error: error,
      stack: stack,
      user: user,
      data: data,
      tag: tag,
      tagKey: tagKey,
      tag2: failure._getValue,
      tag2Key: tagKeyValue,
      errorLevel: errorLevel ?? errorLevelValue ?? ErrorLevelEnum.error,
    );
    return failure;
  }

  static SomeFailure getException({
    required Object error,
    required StackTrace? stack,
    required User? user,
    required String? data,
    required String? tag,
    required String? tagKey,
    required ErrorLevelEnum? errorLevel,
  }) {
    final String tagKeyValue;
    ErrorLevelEnum? errorLevelValue;
    final SomeFailure failure;
    switch (error) {
      case firebase.FirebaseException _:
        return _Exception._getFromFirebasException(
          error: error,
          stack: stack,
          data: data,
          tag: tag,
          tagKey: tagKey,
          user: user,
          errorLevel: errorLevel,
        );
      case String _:
        tagKeyValue = 'String';
        errorLevelValue = ErrorLevelEnum.info;
        switch (error) {
          case 'Code is null':
            failure = SomeFailure.wrongVerifyCode;
          case 'Invalid input':
            failure = SomeFailure.invalidInput;
          default:
            failure = SomeFailure.serverError;
        }
      case Exception _:
        switch (error) {
          case PlatformException _:
            tagKeyValue = 'Exception';
            switch (error.code) {
              case 'network_error':
                failure = SomeFailure.network;
                errorLevelValue = ErrorLevelEnum.info;

              case 'permission_denied':
                failure = SomeFailure.permission;
                errorLevelValue = ErrorLevelEnum.info;

              case 'file_not_found':
                failure = SomeFailure.dataNotFound;
                errorLevelValue = ErrorLevelEnum.error;

              case 'timeout':
                failure = SomeFailure.timeout;
                errorLevelValue = ErrorLevelEnum.warning;

              case 'invalid_input':
                failure = SomeFailure.invalidInput;
                errorLevelValue = ErrorLevelEnum.error;
              case 'unknown':
              default:
                failure = SomeFailure.serverError;
                errorLevelValue = ErrorLevelEnum.fatal;
            }
          default:
            final errorMessage = error.toString().toLowerCase();
            tagKeyValue = 'Unkown Exception';
            switch (errorMessage) {
              case final m when m.contains('timeoutexception'):
                failure = SomeFailure.timeout;
                errorLevelValue = ErrorLevelEnum.warning;
              case final m when m.contains('socketexception'):
                failure = SomeFailure.network;
                errorLevelValue = ErrorLevelEnum.warning;
              case final m when m.contains('formatexception'):
                failure = SomeFailure.format;
                errorLevelValue = ErrorLevelEnum.warning;
              case final m when m.contains('unimplementederror'):
                failure = SomeFailure.unimplementedFeature;
                errorLevelValue = ErrorLevelEnum.error;
              case final m
                  when m.contains('connection refused') ||
                      m.contains('no internet') ||
                      m.contains('network-request') ||
                      m.contains('resource limit exceeded') ||
                      m.contains('offline') ||
                      m.contains('failed-precondition'):
                failure = SomeFailure.network;
                errorLevelValue = ErrorLevelEnum.info;
              case final m when m.contains('permission-denied'):
                failure = SomeFailure.permission;
                errorLevelValue = ErrorLevelEnum.info;
              case final m when m.contains('outofmemoryerror'):
                failure = SomeFailure.assertion;
                errorLevelValue = ErrorLevelEnum.fatal;
              default:
                failure = SomeFailure.serverError;
            }
        }
      case Error _:
        tagKeyValue = 'Error';
        switch (error) {
          case AssertionError _:
            failure = SomeFailure.assertion;
            errorLevelValue = ErrorLevelEnum.fatal;
          case TypeError _:
            failure = SomeFailure.type;
            errorLevelValue = ErrorLevelEnum.error;
          case NoSuchMethodError _:
            failure = SomeFailure.noSuchMethodError;
            errorLevelValue = ErrorLevelEnum.error;
          case UnsupportedError _:
            failure = SomeFailure.unsupported;
            errorLevelValue = ErrorLevelEnum.error;
          default:
            failure = SomeFailure.serverError;
            errorLevelValue = ErrorLevelEnum.fatal;
        }
      default:
        tagKeyValue = 'Unkown';
        failure = SomeFailure.serverError;
        errorLevelValue = ErrorLevelEnum.error;
    }
    _send(
      error: error,
      stack: stack,
      user: user,
      data: data,
      tag: tag,
      tagKey: tagKey,
      tag2: failure._getValue,
      tag2Key: tagKeyValue,
      errorLevel: errorLevel ?? errorLevelValue ?? ErrorLevelEnum.error,
    );

    return failure;
  }
}
