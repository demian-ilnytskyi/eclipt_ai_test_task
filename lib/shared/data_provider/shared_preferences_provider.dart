import 'dart:async';

import 'package:exlipt_ai_test_task/shared/shared_dart.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class SharedPrefencesProvider {
  final SharedPreferences _sharedPreferences = GetIt.I.get<SharedPreferences>();

  String? getString(String key) {
    return valueErrorHelper(
      () => _sharedPreferences.getString(key),
      failureValue: null,
      methodName: 'getString',
      className: 'Shared Prefences',
      data: 'Key: $key',
    );
  }

  Future<bool> setString({required String key, required String value}) async {
    return valueFutureErrorHelper(
      () async => _sharedPreferences.setString(key, value),
      failureValue: false,
      methodName: 'setString',
      className: 'Shared Prefences',
      data: 'Key: $key, Value: $value',
    );
  }

  double? getDouble(String key) {
    return valueErrorHelper(
      () => _sharedPreferences.getDouble(key),
      failureValue: null,
      methodName: 'getDouble',
      className: 'Shared Prefences',
      data: 'Key: $key',
    );
  }

  Future<bool> setDouble({required String key, required double value}) async {
    return valueFutureErrorHelper(
      () async => _sharedPreferences.setDouble(key, value),
      failureValue: false,
      methodName: 'setDouble',
      className: 'Shared Prefences',
      data: 'Key: $key, Value: $value',
    );
  }

  bool? getBool(String key) {
    return valueErrorHelper(
      () => _sharedPreferences.getBool(key),
      failureValue: null,
      methodName: 'getBool',
      className: 'Shared Prefences',
      data: 'Key: $key',
    );
  }

  Future<bool> setBool({required String key, required bool value}) async {
    return valueFutureErrorHelper(
      () async => _sharedPreferences.setBool(key, value),
      failureValue: false,
      methodName: 'setBool',
      className: 'Shared Prefences',
      data: 'Key: $key, Value: $value',
    );
  }

  Future<bool> remove(String key) async {
    return valueFutureErrorHelper(
      () async => _sharedPreferences.remove(key),
      failureValue: false,
      methodName: 'remove',
      className: 'Shared Prefences',
      data: 'Key: $key',
    );
  }
}
