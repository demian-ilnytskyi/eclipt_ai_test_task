import 'dart:async';

import 'package:exlipt_ai_test_task/shared/bloc/user/user_watcher_bloc.dart';
import 'package:flutter/material.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(
    Stream<dynamic> stream,
    Stream<UserWatcherState> userStream,
  ) {
    notifyListeners();
    _previousMessage = null;
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
    _userSubscription = userStream.asBroadcastStream().listen((state) {
      if (state.user.isNotEmpty) {
        final currentMessage = state.userSetting.message;

        if (currentMessage != _previousMessage) {
          _previousMessage = currentMessage;
          notifyListeners();
        }
      }
    });
  }
  late final StreamSubscription<dynamic> _subscription;
  late final StreamSubscription<dynamic> _userSubscription;
  String? _previousMessage;

  @override
  void dispose() {
    _subscription.cancel();
    _userSubscription.cancel();
    super.dispose();
  }
}
