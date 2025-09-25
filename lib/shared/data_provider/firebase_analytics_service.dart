import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsService {
  static FirebaseAnalyticsObserver get observer => FirebaseAnalyticsObserver(
    analytics: FirebaseAnalytics.instance,
    onError: (e) => log(
      e.code,
      error:
          'Message: ${e.message},Detail ${e.details},'
          ' StackTrace ${e.stacktrace}',
      name: 'Firebase Analytics',
    ),
  );
}
