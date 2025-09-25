import 'dart:async';
import 'dart:developer' show log;

import 'package:dartz/dartz.dart';
import 'package:exlipt_ai_test_task/shared/shared_dart.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthenticationRepository {
  AuthenticationRepository({
    required IAppAuthenticationRepository appAuthenticationRepository,
  }) : _appAuthenticationRepository = appAuthenticationRepository {
    // Listen to currentUser changes and emit auth status
    _authenticationStatuscontroller =
        StreamController<AuthenticationStatus>.broadcast(
          onListen: _onUserStreamListen,
          onCancel: _onUserStreamCancel,
        );
  }

  final IAppAuthenticationRepository _appAuthenticationRepository;
  late StreamController<AuthenticationStatus> _authenticationStatuscontroller;
  StreamSubscription<User>? _userSubscription;

  void _onUserStreamListen() {
    _userSubscription ??= _appAuthenticationRepository.user.listen((
      currentUser,
    ) {
      if (currentUser.isNotEmpty) {
        _authenticationStatuscontroller.add(AuthenticationStatus.authenticated);
      } else {
        _authenticationStatuscontroller.add(
          AuthenticationStatus.unauthenticated,
        );
      }
    });
  }

  void _onUserStreamCancel() {
    _userSubscription?.cancel();
    _userSubscription = null;
  }

  Stream<AuthenticationStatus> get status =>
      _authenticationStatuscontroller.stream;

  Future<Either<SomeFailure, bool>> deleteUser() async {
    final result = await _appAuthenticationRepository.deleteUser();
    return result.fold(Left.new, (r) {
      _authenticationStatuscontroller.add(AuthenticationStatus.unknown);
      log('User deleted');
      return Right(r);
    });
  }

  Future<Either<SomeFailure, bool>> signIn({
    required String email,
    required String password,
  }) async {
    final result = await _appAuthenticationRepository.logInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.fold(
      (l) {
        _authenticationStatuscontroller.add(AuthenticationStatus.unknown);
        return Left(l);
      },
      (r) {
        log('authenticated');
        if (r != null) {
          _authenticationStatuscontroller.add(
            AuthenticationStatus.authenticated,
          );
        }
        return const Right(true);
      },
    );
  }

  Future<Either<SomeFailure, bool>> signUp({
    required String email,
    required String password,
  }) async {
    final result = await _appAuthenticationRepository.signUp(
      email: email,
      password: password,
    );
    return result.fold(
      (l) {
        _authenticationStatuscontroller.add(AuthenticationStatus.unknown);
        return Left(l);
      },
      (r) {
        log('authenticated');
        if (r != null) {
          _authenticationStatuscontroller.add(
            AuthenticationStatus.authenticated,
          );
        }
        return const Right(true);
      },
    );
  }

  Future<Either<SomeFailure, bool>> logOut() async {
    final result = await _appAuthenticationRepository.logOut();
    return result.fold(
      (l) {
        return Left(l);
      },
      (r) {
        log('Log out', name: 'Authentication Repository');
        _authenticationStatuscontroller.add(
          AuthenticationStatus.unauthenticated,
        );

        return Right(r);
      },
    );
  }

  AuthenticationStatus get currectAuthenticationStatus {
    if (_appAuthenticationRepository.currentUser.isEmpty) {
      return AuthenticationStatus.unknown;
    } else {
      return AuthenticationStatus.authenticated;
    }
  }

  @disposeMethod
  Future<void> dispose() async {
    await _authenticationStatuscontroller.close();
  }
}
