import 'dart:async';
import 'dart:developer' show log;

import 'package:dartz/dartz.dart';
import 'package:exlipt_ai_test_task/shared/shared_dart.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:freezed_annotation/freezed_annotation.dart'
    show visibleForTesting;
import 'package:injectable/injectable.dart';

@Singleton(as: IAppAuthenticationRepository)
class AppAuthenticationRepository implements IAppAuthenticationRepository {
  AppAuthenticationRepository({
    required firebase_auth.FirebaseAuth firebaseAuth,
    required CacheClient cache,
    required UserSettingCacheRepository userSettingCacheRepository,
    required FirestoreService firestoreService,
  }) : _firebaseAuth = firebaseAuth,
       _firestoreService = firestoreService,
       _userSettingCacheRepository = userSettingCacheRepository,
       _cache = cache {
    _updateUserBasedOnCache();
    _updateUserSettingBasedOnCache();
  }
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirestoreService _firestoreService;
  final CacheClient _cache;
  final UserSettingCacheRepository _userSettingCacheRepository;

  /// User cache key.
  /// Should only be used for testing purposes.
  @visibleForTesting
  static const userCacheKey = '__user_cache_key__';
  @visibleForTesting
  static const userSettingCacheKey = '__user_setting_cache_key__';

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.
  @override
  Stream<User> get user => _firebaseAuth.userChanges().map((userCredentional) {
    log('================================================');
    if (userCredentional != null) {
      log('Firebase Auth State Changed: User is authenticated');
      log(
        'Firebase User Details: $userCredentional',
        name: 'User',
        sequenceNumber: 1,
      );
      final user = userCredentional.toUser;
      _cache.write(key: userCacheKey, value: user);
      return user;
    } else {
      log(
        'Firebase Auth State Changed: '
        'User is unauthenticated (User.empty)',
      );
      return User.empty;
    }
  });

  @override
  Stream<UserSetting> userSetting(String userId) =>
      _firestoreService.getUserSetting(userId).map((userCredentionalSetting) {
        _userSettingCacheRepository.updateUserCache(userCredentionalSetting);
        if (userCredentionalSetting.isNotEmpty) {
          log('================================================');
          log('Firebase User Setting Changed');
          log('Firebase User Setting: $userCredentionalSetting');
          _cache.write(
            key: userSettingCacheKey,
            value: userCredentionalSetting,
          );
        } else {
          log('Firebase User Settting is empty');
        }
        return userCredentionalSetting;
      });

  /// Returns the current cached user.
  /// Defaults to [User.empty] if there is no cached user.
  @override
  User get currentUser => _cache.read<User>(key: userCacheKey) ?? User.empty;
  @override
  UserSetting get currentUserSetting =>
      _cache.read<UserSetting>(key: userSettingCacheKey) ??
      _userSettingCacheRepository.getCacheUserSetting;

  /// Signs in with the provided [email] and [password].
  @override
  Future<Either<SomeFailure, User?>> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async => _handleAuthOperation(
    operation: () async => _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    ),
    methodName: 'logInWithEmailAndPassword',
    data: 'Email: $email | Password: $password',
  );

  /// Creates a new user with the provided [email] and [password].
  @override
  Future<Either<SomeFailure, User?>> signUp({
    required String email,
    required String password,
  }) async => _handleAuthOperation(
    operation: () async {
      final userCredentional = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredentional;
    },
    methodName: 'signUp',
    data: 'Email: $email | Password: $password',
  );

  /// Signs out the current user which will emit
  /// [User.empty] from the [user] Stream.
  @override
  Future<Either<SomeFailure, bool>> logOut() async {
    return eitherFutureHelper(
      () async {
        await _firebaseAuth.signOut();

        _userSettingCacheRepository.clearUserSettingCache();
        _cache.clear();
        return const Right(true);
      },
      methodName: 'logOut',
      className: 'AppAuthenticationRepository',
      user: currentUser,
    );
    // finally {
    //   _updateAuthStatusBasedOnCache();
    //   _updateUserSettingBasedOnCache();
    // }
  }

  Future<Either<SomeFailure, User?>> _handleAuthOperation({
    required Future<firebase_auth.UserCredential> Function() operation,
    required String methodName,
    String? data,
  }) async {
    return eitherFutureHelper(
      () async {
        final userCredentional = await operation();
        return Right(userCredentional.user?.toUser);
      },
      methodName: methodName,
      className: 'AppAuthenticationRepository',
      data: data,
      user: currentUser,
      finallyFunction: () {
        _updateUserBasedOnCache();
        _updateUserSettingBasedOnCache();
      },
    );
  }

  void _updateUserBasedOnCache() {
    log('Updating auth status based on cache');
    final user = currentUser.isEmpty;
    log(
      'Current user inside '
      '_updateAuthStatusBasedOnCache : $currentUser',
    );
    log('user is $user', name: 'Cache User', level: 1);
  }

  void _updateUserSettingBasedOnCache() {
    log('Updating user setting based on cache');
    final userSetting = currentUserSetting.isEmpty;
    log(
      'Current user setting inside '
      '_updateAuthStatusBasedOnCache : $currentUserSetting',
    );
    log('userSertting is $userSetting', name: 'Cache User Setting', level: 1);
  }

  @override
  Future<Either<SomeFailure, bool>> deleteUser() async {
    return eitherFutureHelper(
      () async {
        await _firestoreService.deleteUserSetting(userId: currentUser.id);
        await _firebaseAuth.currentUser?.delete();

        _userSettingCacheRepository.clearUserSettingCache();
        _cache.clear();

        return const Right(true);
      },
      methodName: 'deleteUser',
      className: 'AppAuthenticationRepository',
      user: currentUser,
    );
  }

  @override
  Future<Either<SomeFailure, UserSetting>> updateUserSetting(
    UserSetting userSetting,
  ) async {
    return eitherFutureHelper(
      () async {
        if (currentUser.isNotEmpty) {
          await _firestoreService.setUserSetting(
            userSetting: userSetting.copyWith(
              createdAt: userSetting.createdAt ?? DateTime.now(),
              updatedAt: DateTime.now(),
            ),
            userId: currentUser.id,
          );
          return Right(userSetting);
        }
        return Right(userSetting);
      },
      methodName: 'updateUserSetting',
      data: 'User Setting: $userSetting',
      className: 'AppAuthenticationRepository',
      user: currentUser,
      finallyFunction: _updateUserSettingBasedOnCache,
    );
  }
}

extension on firebase_auth.User {
  User get toUser => User(
    id: uid,
    email: email,
    name: displayName,
    photo: photoURL,
    phoneNumber: phoneNumber,
  );
}
