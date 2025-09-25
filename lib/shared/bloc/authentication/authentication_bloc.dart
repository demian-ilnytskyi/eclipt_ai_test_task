import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exlipt_ai_test_task/shared/shared_dart.dart';
import 'package:injectable/injectable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

@singleton
class AuthenticationBloc
    extends Bloc<_AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository,
       super(
         AuthenticationState._(
           status: authenticationRepository.currectAuthenticationStatus,
         ),
       ) {
    on<_AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
    on<AuthenticationDeleteRequested>(_onAuthenticationDeleteRequested);
    // on<AuthenticationInitialized>(_onAuthenticationInitialized);
    on<_AuthenticationFailureEvent>(_onAuthenticationFailure);
    _onAuthenticationInitialized();
  }

  final AuthenticationRepository _authenticationRepository;
  late StreamSubscription<AuthenticationStatus>
  _authenticationStatusSubscription;

  @override
  Future<void> close() async {
    await _authenticationStatusSubscription.cancel();
    await _authenticationRepository.dispose();
    return super.close();
  }

  void _onAuthenticationStatusChanged(
    _AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) {
    log('Authentication Changed: ${event.status}');
    switch (event.status) {
      case AuthenticationStatus.authenticated:
        return emit(const AuthenticationState.authenticated());
      case AuthenticationStatus.unauthenticated:
        return emit(const AuthenticationState.unauthenticated());
      case AuthenticationStatus.unknown:
        return emit(const AuthenticationState.unknown());
    }
  }

  Future<void> _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    await _authenticationRepository.logOut();
  }

  Future<void> _onAuthenticationDeleteRequested(
    AuthenticationDeleteRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    await _authenticationRepository.deleteUser();
  }

  void _onAuthenticationInitialized(
    // AuthenticationInitialized event,
    // Emitter<AuthenticationState> emit,
  ) {
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (status) => add(_AuthenticationStatusChanged(status)),
      onError: (Object error, StackTrace stack) =>
          add(_AuthenticationFailureEvent(stack: stack, error: error)),
    );
  }

  void _onAuthenticationFailure(
    _AuthenticationFailureEvent event,
    Emitter<AuthenticationState> emit,
  ) {
    emit(
      AuthenticationState.failure(
        previousStatus: state.status,
        failure: SomeFailure.value(
          error: event.error,
          stack: event.stack,
          tag: 'Authentication Bloc',
          tagKey: 'Stream',
        ),
      ),
    );
  }
}

// extension UserChecker on User? {
//   bool get hasValue => this != null && this!.isNotEmpty;
// }
