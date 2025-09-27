part of 'profile_bloc.dart';

@freezed
sealed class ProfileState with _$ProfileState {
  const factory ProfileState({
    required MessageFieldModel message,
    required SomeFailure? failure,
    required ProfileEnum formState,
  }) = _ProfileState;
}

enum ProfileEnum { initial, inProgress, invalidData, procesing, success }
