import 'dart:async';
import 'dart:developer' show log;

import 'package:exlipt_ai_test_task/shared/shared_dart.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart'
    deferred as firebase_crashlytics;

// @LazySingleton(order: -2)
class FailureRepository {
  static bool _libraryInited = false;
  static FutureOr<void> onError({
    required Object error,
    required StackTrace? stack,
    required String? reason,
    required Iterable<Object>? information,
    required ErrorLevelEnum errorLevel,
    required String? tag,
    required String? tagKey,
    String? tag2,
    String? tag2Key,
    String? data,
    User? user,
  }) async {
    // Define the variable for error level categorization
    if (Config.isReleaseMode) {
      try {
        if (!_libraryInited) {
          await firebase_crashlytics.loadLibrary();
        } else {
          _libraryInited = true;
        }
        await firebase_crashlytics.FirebaseCrashlytics.instance.recordError(
          error,
          stack,
          reason: reason ?? errorLevel.toString(),
          information: information ?? const [],
          printDetails: information == null,
          fatal: errorLevel == ErrorLevelEnum.fatal,
        );
        if (tag != null) {
          await firebase_crashlytics.FirebaseCrashlytics.instance.setCustomKey(
            tagKey.toString(),
            tag,
          );
        }
        if (tag2 != null) {
          await firebase_crashlytics.FirebaseCrashlytics.instance.setCustomKey(
            tag2Key.toString(),
            tag2,
          );
        }
        if (data != null) {
          await firebase_crashlytics.FirebaseCrashlytics.instance.setCustomKey(
            'Data',
            data,
          );
        }
      } catch (e) {
        log('EXCEPTION send Error');
      }
    }
    log(
      'EXCEPTION $tagKey: $tag.',
      stackTrace: stack,
      error: error,
      name: 'ERROR!!!',
    );
  }
}
