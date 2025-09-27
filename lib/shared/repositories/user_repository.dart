import 'dart:async';
import 'dart:developer' show log;

import 'package:dartz/dartz.dart';
import 'package:exlipt_ai_test_task/shared/shared_dart.dart';
import 'package:injectable/injectable.dart';

@singleton
class UserRepository {
  UserRepository({
    required IAppAuthenticationRepository appAuthenticationRepository,
  }) : _appAuthenticationRepository = appAuthenticationRepository {
    _userController = StreamController<User>.broadcast(
      onListen: _onUserStreamListen,
      onCancel: _onUserStreamCancel,
    );
    _userSettingController = StreamController<UserSetting>.broadcast(
      onListen: _onUserStreamListen,
      onCancel: _onUserSettingStreamCancel,
    );
  }
  final IAppAuthenticationRepository _appAuthenticationRepository;

  late StreamController<UserSetting> _userSettingController;
  late StreamController<User> _userController;
  StreamSubscription<User>? _userSubscription;
  StreamSubscription<UserSetting>? _userSettingSubscription;
  StreamSubscription<String>? _fcmTokenSubscription;

  void _onUserStreamListen() {
    _userSubscription ??= _appAuthenticationRepository.user.listen((
      currentUser,
    ) async {
      if (currentUser.isNotEmpty) {
        _userController.add(currentUser);
        if (currentUserSetting.id != currentUser.id &&
            _userSettingSubscription != null) {
          await _userSettingSubscription?.cancel();
          _userSettingSubscription = null;
          _userSettingController.add(
            currentUserSetting.copyWith(id: currentUser.id),
          );
        }
        _userSettingSubscription ??= _appAuthenticationRepository
            .userSetting(currentUser.id)
            .listen((currentUserSettingValue) {
              _userSettingController.add(currentUserSettingValue);
            });
      } else {
        await _userSettingSubscription?.cancel();
        _userSettingSubscription = null;
      }
    });
  }

  void _onUserStreamCancel() {
    _userSubscription?.cancel();
    _userSubscription = null;
  }

  void _onUserSettingStreamCancel() {
    _userSettingSubscription?.cancel();
    _fcmTokenSubscription?.cancel();
    _userSettingSubscription = null;
  }

  Stream<UserSetting> get userSetting => _userSettingController.stream;
  Stream<User> get user => _userController.stream;

  User get currentUser {
    return _appAuthenticationRepository.currentUser;
  }

  UserSetting get currentUserSetting {
    return _appAuthenticationRepository.currentUserSetting;
  }

  Future<Either<SomeFailure, bool>> updateUserSetting({
    required UserSetting userSetting,
  }) async {
    final result = await _appAuthenticationRepository.updateUserSetting(
      userSetting,
    );
    return result.fold(Left.new, (success) {
      _userSettingController.add(success);
      log('User Setting Updated, new is $success', name: 'User Setting');
      return const Right(true);
    });
  }

  Future<void> dispose() async {
    await _userController.close();

    await _userSettingController.close();
  }
}
