part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.messageUpdated(String message) = _MessageUpdated;

  const factory ProfileEvent.save() = _Save;
}
