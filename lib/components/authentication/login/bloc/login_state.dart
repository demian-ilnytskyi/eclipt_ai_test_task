part of 'login_bloc.dart';

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState({
    required EmailFieldModel email,
    required PasswordFieldModel password,
    required SomeFailure? failure,
    required LoginEnum formState,
  }) = _LoginState;
}

enum LoginEnum { initial, inProgress, invalidData, procesing }
