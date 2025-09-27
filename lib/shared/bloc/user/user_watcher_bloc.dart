import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exlipt_ai_test_task/shared/shared_dart.dart';
import 'package:injectable/injectable.dart';

part 'user_watcher_event.dart';
part 'user_watcher_state.dart';

@singleton
class UserWatcherBloc extends Bloc<_UserWatcherEvent, UserWatcherState> {
  UserWatcherBloc({required UserRepository userRepository})
    : _userRepository = userRepository,
      super(
        UserWatcherState(
          user: userRepository.currentUser,
          userSetting: userRepository.currentUserSetting,
        ),
      ) {
    on<_UserChangedEvent>(_onUserChanged);
    on<_UserSettingChangedEvent>(_onUserSettingChanged);
    on<_UserFailureEvent>(_onUserFailure);
    on<_UserSettingFailureEvent>(_onUserSettingFailure);
    _onStarted();
  }
  late StreamSubscription<UserSetting> _userSettingSubscription;
  late StreamSubscription<User> _userSubscription;
  final UserRepository _userRepository;
  void _onStarted() {
    _userSettingSubscription = _userRepository.userSetting.listen(
      (userSetting) => add(_UserSettingChangedEvent(userSetting)),
      onError: (Object error, StackTrace stack) =>
          add(_UserSettingFailureEvent(stack: stack, error: error)),
    );
    _userSubscription = _userRepository.user.listen(
      (user) => add(_UserChangedEvent(user)),
      onError: (Object error, StackTrace stack) =>
          add(_UserFailureEvent(stack: stack, error: error)),
    );
  }

  void _onUserChanged(_UserChangedEvent event, Emitter<UserWatcherState> emit) {
    emit(state.copyWith(user: event.user));
  }

  void _onUserSettingChanged(
    _UserSettingChangedEvent event,
    Emitter<UserWatcherState> emit,
  ) {
    emit(state.copyWith(userSetting: event.userSetting));
  }

  void _onUserFailure(_UserFailureEvent event, Emitter<UserWatcherState> emit) {
    emit(
      UserWatcherState(
        user: state.user,
        userSetting: state.userSetting,
        failure: SomeFailure.value(
          error: event.error,
          stack: event.stack,
          tag: 'User Watcher Bloc',
          tagKey: 'User Stream',
        ),
      ),
    );
  }

  void _onUserSettingFailure(
    _UserSettingFailureEvent event,
    Emitter<UserWatcherState> emit,
  ) {
    emit(
      UserWatcherState(
        user: state.user,
        userSetting: state.userSetting,
        failure: SomeFailure.value(
          error: event.error,
          stack: event.stack,
          tag: 'User Watcher Bloc',
          tagKey: 'User Setting Stream',
        ),
      ),
    );
  }

  @override
  Future<void> close() async {
    await _userSettingSubscription.cancel();
    await _userSubscription.cancel();
    await _userRepository.dispose();
    return super.close();
  }
}
