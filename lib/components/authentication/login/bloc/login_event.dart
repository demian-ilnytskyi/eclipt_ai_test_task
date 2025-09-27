part of 'login_bloc.dart';

@freezed
sealed class LoginEvent with _$LoginEvent {
  const factory LoginEvent.emailUpdated(String email) = _EmailUpdated;

  const factory LoginEvent.passwordUpdated(String password) = _PasswordUpdated;

  const factory LoginEvent.loginSubmitted() = _LoginSubmitted;
}
