import 'package:bloc/bloc.dart';
import 'package:exlipt_ai_test_task/shared/shared_dart.dart';
import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required AuthenticationRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository,
      super(
        const LoginState(
          email: EmailFieldModel.pure(),
          password: PasswordFieldModel.pure(),
          failure: null,
          formState: LoginEnum.initial,
        ),
      ) {
    on<_EmailUpdated>(_onEmailUpdated);
    on<_PasswordUpdated>(_onPasswordUpdated);
    on<_LoginSubmitted>(_onLoginSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _onEmailUpdated(
    _EmailUpdated event,
    Emitter<LoginState> emit,
  ) async {
    emit(
      state.copyWith(
        email: EmailFieldModel.dirty(event.email),
        failure: null,
        formState: LoginEnum.inProgress,
      ),
    );
  }

  Future<void> _onPasswordUpdated(
    _PasswordUpdated event,
    Emitter<LoginState> emit,
  ) async {
    emit(
      state.copyWith(
        password: PasswordFieldModel.dirty(event.password),
        failure: null,
        formState: LoginEnum.inProgress,
      ),
    );
  }

  Future<void> _onLoginSubmitted(
    _LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (Formz.validate([state.password, state.email])) {
      emit(state.copyWith(formState: LoginEnum.procesing));
      // emit(state.copyWith(fieldsIsCorrect: true));
      final result = await _authenticationRepository.signIn(
        email: state.email.value,
        password: state.password.value,
      );

      result.fold(
        (l) =>
            emit(state.copyWith(failure: l, formState: LoginEnum.inProgress)),
        (r) => emit(
          const LoginState(
            email: EmailFieldModel.pure(),
            password: PasswordFieldModel.pure(),
            failure: null,
            formState: LoginEnum.procesing,
          ),
        ),
      );
    } else {
      emit(state.copyWith(formState: LoginEnum.invalidData));
    }
  }
}
