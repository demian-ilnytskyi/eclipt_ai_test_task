import 'dart:async';
import 'dart:ui';

import 'package:exlipt_ai_test_task/app.dart';
import 'package:exlipt_ai_test_task/bootstrap.dart';
import 'package:exlipt_ai_test_task/firebase_options.dart';
import 'package:exlipt_ai_test_task/shared/constants/config.dart';
import 'package:exlipt_ai_test_task/shared/constants/enum.dart';
import 'package:exlipt_ai_test_task/shared/models/failure_model/some_failure.dart';
import 'package:exlipt_ai_test_task/shared/repositories/failure_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart'
    show DiagnosticLevel, FlutterError, WidgetsFlutterBinding;

/// COMMENT: PROD main file
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  if (Config.isReleaseMode) {
    await FirebasePerformance.instance.setPerformanceCollectionEnabled(
      Config.isReleaseMode,
    );
  }

  // Non-async exceptions handling
  FlutterError.onError = (details) {
    // Declare error level variable for classification
    late ErrorLevelEnum errorLevel;

    // Determine the error level based on exception type or details
    if (details.exception is AssertionError ||
        details.exception.toString().contains('OutOfMemoryError')) {
      // Set as fatal for critical issues
      errorLevel = ErrorLevelEnum.fatal;
    } else if (details.stack != null) {
      // Set as error if stack trace is available
      errorLevel = ErrorLevelEnum.error;
    } else if (details.informationCollector != null) {
      // Set as info if additional information is available
      errorLevel = ErrorLevelEnum.info;
    } else {
      // Set as warning for less severe issues
      errorLevel = ErrorLevelEnum.warning;
    }

    // Log the error details to FailureRepository with specified level and tags
    FailureRepository.onError(
      error: details,
      stack: details.stack,
      information: details.informationCollector?.call(),
      reason: details.context
          ?.toStringDeep(minLevel: DiagnosticLevel.info)
          .trim(),
      errorLevel: errorLevel,
      tag: 'Not Async', // Tag to identify non-async exceptions
      tagKey: 'Main', // Key for identifying error location/source
    );
  };

  // Async exceptions handling
  PlatformDispatcher.instance.onError = (error, stack) {
    // Log the error details to FailureRepository with specified level and tags
    SomeFailure.value(
      error: error,
      stack: stack,
      tag: 'Async', // Tag to identify async exceptions
      tagKey: 'Main', // Key for identifying error location/source
    );

    return true; // Return true to indicate the error has been handled
  };

  await bootstrap(App.new);
}
