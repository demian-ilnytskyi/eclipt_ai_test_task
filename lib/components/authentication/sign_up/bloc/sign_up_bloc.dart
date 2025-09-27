import 'package:bloc/bloc.dart';
import 'package:exlipt_ai_test_task/shared/shared_dart.dart';
import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_bloc.freezed.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({required AuthenticationRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository,
      super(
        const SignUpState(
          email: EmailFieldModel.pure(),
          password: PasswordFieldModel.pure(),
          confirmPassword: PasswordFieldModel.pure(),
          failure: null,
          formState: SignUpEnum.initial,
        ),
      ) {
    on<_EmailUpdated>(_onEmailUpdated);
    on<_PasswordUpdated>(_onPasswordUpdated);
    on<_ConfirmPasswordUpdated>(_onConfirmPasswordUpdated);
    on<_SignUpSubmitted>(_onSignUpSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _onEmailUpdated(
    _EmailUpdated event,
    Emitter<SignUpState> emit,
  ) async {
    emit(
      state.copyWith(
        email: EmailFieldModel.dirty(event.email),
        failure: null,
        formState: SignUpEnum.inProgress,
      ),
    );
  }

  Future<void> _onPasswordUpdated(
    _PasswordUpdated event,
    Emitter<SignUpState> emit,
  ) async {
    emit(
      state.copyWith(
        password: PasswordFieldModel.dirty(event.password),
        failure: null,
        formState: SignUpEnum.inProgress,
      ),
    );
  }

  Future<void> _onConfirmPasswordUpdated(
    _ConfirmPasswordUpdated event,
    Emitter<SignUpState> emit,
  ) async {
    emit(
      state.copyWith(
        confirmPassword: PasswordFieldModel.dirty(event.password),
        failure: null,
        formState: SignUpEnum.inProgress,
      ),
    );
  }

  Future<void> _onSignUpSubmitted(
    _SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    if (Formz.validate([state.password, state.email])) {
      if (state.password.value != state.confirmPassword.value) {
        emit(state.copyWith(formState: SignUpEnum.invlaidConfirmPassword));
      }
      emit(state.copyWith(formState: SignUpEnum.procesing));
      final result = await _authenticationRepository.signUp(
        email: state.email.value,
        password: state.password.value,
      );
      emit(
        result.fold(
          (l) => state.copyWith(failure: l, formState: SignUpEnum.inProgress),
          (r) => const SignUpState(
            email: EmailFieldModel.pure(),
            password: PasswordFieldModel.pure(),
            confirmPassword: PasswordFieldModel.pure(),
            failure: null,
            formState: SignUpEnum.procesing,
          ),
        ),
      );
    } else {
      emit(state.copyWith(formState: SignUpEnum.invalidData));
    }
  }
}
