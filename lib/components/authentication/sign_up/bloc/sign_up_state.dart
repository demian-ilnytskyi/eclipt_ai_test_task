part of 'sign_up_bloc.dart';

@freezed
sealed class SignUpState with _$SignUpState {
  const factory SignUpState({
    required EmailFieldModel email,
    required PasswordFieldModel password,
    required PasswordFieldModel confirmPassword,
    required SomeFailure? failure,
    required SignUpEnum formState,
  }) = _SignUpState;
}

enum SignUpEnum {
  initial,
  inProgress,
  invalidData,
  invlaidConfirmPassword,
  procesing,
  success,
}
