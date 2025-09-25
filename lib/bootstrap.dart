import 'dart:async' show FutureOr;
import 'dart:developer' show log;

import 'package:bloc/bloc.dart';
import 'package:exlipt_ai_test_task/shared/constants/enum.dart';
import 'package:exlipt_ai_test_task/shared/helper/helper.dart';
import 'package:flutter/material.dart' show Colors, Widget, runApp;
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)', name: 'Bootstrap DATA');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log(
      'Bloc Error Runtime Type - ${bloc.runtimeType}',
      error: error,
      stackTrace: stackTrace,
      name: 'Bootstrap Bloc Error',
    );
    super.onError(bloc, error, stackTrace);
  }
}

/// COMMENT: Method adds dependencies in App
Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  Bloc.observer = const AppBlocObserver();

  // Set only Vertical orientation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await _asyncGetItRegister();

  configureDependencies();

  // Add cross-flavor configuration here

  runApp(await builder());
}

Future<void> _asyncGetItRegister() async {
  final sharedPrefences = await SharedPreferences.getInstance();

  GetIt.I.registerSingleton(sharedPrefences);
}
