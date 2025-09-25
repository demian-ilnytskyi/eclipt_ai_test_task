import 'dart:async';

import 'package:exlipt_ai_test_task/components/error/view/error_view.dart';
import 'package:exlipt_ai_test_task/components/home/view/home_view.dart';
import 'package:exlipt_ai_test_task/components/intro/first/view/first_intro_view.dart';
import 'package:exlipt_ai_test_task/shared/shared_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

part 'redirect_authenticate_guard.dart';

const showedIntroKey = '__show_intro_cache_key__';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  // routerNeglect: true,
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => const ErrorScreen(),
  refreshListenable: GoRouterRefreshStream(
    GetIt.instance<AuthenticationBloc>().stream,
  ),
  initialLocation: KRoute.home.path,
  observers: [if (Config.isReleaseMode) FirebaseAnalyticsService.observer],
  redirect: _authenticationRedirect,
  routes: [
    GoRoute(
      name: KRoute.intro.name,
      path: KRoute.intro.path,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        name: state.name,
        restorationId: state.pageKey.value,
        child: const FirstIntroScreen(),
      ),
    ),
    GoRoute(
      name: KRoute.home.name,
      path: KRoute.home.path,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        name: state.name,
        restorationId: state.pageKey.value,
        child: const HomeScreen(),
      ),
    ),
  ],
);
