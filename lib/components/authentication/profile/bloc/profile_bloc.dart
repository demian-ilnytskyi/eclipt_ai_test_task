import 'package:bloc/bloc.dart';
import 'package:exlipt_ai_test_task/shared/shared_dart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required UserRepository userRepository})
    : _userRepository = userRepository,
      super(
        const ProfileState(
          message: MessageFieldModel.pure(),
          failure: null,
          formState: ProfileEnum.initial,
        ),
      ) {
    on<_MessageUpdated>(_onMessageUpdated);
    on<_Save>(_onSave);
  }
  final UserRepository _userRepository;

  Future<void> _onMessageUpdated(
    _MessageUpdated event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        message: MessageFieldModel.dirty(event.message),
        failure: null,
        formState: ProfileEnum.inProgress,
      ),
    );
  }

  Future<void> _onSave(_Save event, Emitter<ProfileState> emit) async {
    if (state.message.isValid) {
      emit(state.copyWith(formState: ProfileEnum.procesing));
      // emit(state.copyWith(fieldsIsCorrect: true));
      final result = await _userRepository.updateUserSetting(
        userSetting: _userRepository.currentUserSetting.copyWith(
          message: state.message.value,
        ),
      );

      result.fold(
        (l) =>
            emit(state.copyWith(failure: l, formState: ProfileEnum.inProgress)),
        (r) => emit(
          const ProfileState(
            message: MessageFieldModel.pure(),
            failure: null,
            formState: ProfileEnum.success,
          ),
        ),
      );
    } else {
      emit(state.copyWith(formState: ProfileEnum.invalidData));
    }
  }
}
