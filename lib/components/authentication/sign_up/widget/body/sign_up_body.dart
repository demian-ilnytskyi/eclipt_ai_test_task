import 'package:exlipt_ai_test_task/components/authentication/sign_up/bloc/sign_up_bloc.dart';
import 'package:exlipt_ai_test_task/components/authentication/widget/password_field_widget.dart';
import 'package:exlipt_ai_test_task/shared/models/failure_model/failure_extension.dart';
import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: KPadding.kPaddingSize26,
        left: KPadding.kPaddingSize32,
      ),
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KSizedBox.kHeightSizedBox19,
            Text(
              context.l10n.createAnAccount,
              style: AppTextStyle.pageTitle,
              textAlign: TextAlign.start,
            ),
            KSizedBox.kHeightSizedBox33,
            TextFieldWidget(
              onChanged: (value) => context.read<SignUpBloc>().add(
                SignUpEvent.emailUpdated(value),
              ),
              labelText: context.l10n.email,
              prefixIcon: KIcon.person,
              keyboardType: TextInputType.emailAddress,
              showErrorText: state.formState == SignUpEnum.invalidData,
              errorText: state.email.error.value(context),
            ),
            KSizedBox.kHeightSizedBox31,
            PasswordFieldWidget(
              onChanged: (value) => context.read<SignUpBloc>().add(
                SignUpEvent.passwordUpdated(value),
              ),
              labelText: context.l10n.password,
              showErrorText: state.formState == SignUpEnum.invalidData,
              errorText: state.password.error.value(context),
            ),
            KSizedBox.kHeightSizedBox31,
            PasswordFieldWidget(
              onChanged: (value) => context.read<SignUpBloc>().add(
                SignUpEvent.confirmPasswordUpdated(value),
              ),
              labelText: context.l10n.confirmPassword,
              showErrorText:
                  state.formState == SignUpEnum.invlaidConfirmPassword,
              errorText:
                  '${context.l10n.confirmPassword}'
                  ' ${context.l10n.confirmPasswordInvalid}',
            ),
            KSizedBox.kHeightSizedBox31,
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => context.read<SignUpBloc>().add(
                  const SignUpEvent.signUpSubmitted(),
                ),
                style: KButtonStyles.authentication,
                child: Text(
                  context.l10n.createAccount,
                  style: AppTextStyle.redButton,
                ),
              ),
            ),
            SendingTextWidget(
              failureText: state.failure?.value(context),
              sendingText: context.l10n.signingUpWait,
              successText: null,
              showSendingText: state.formState == SignUpEnum.procesing,
            ),
            KSizedBox.kHeightSizedBox21,
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: context.l10n.iAlreadyHaveAnAccount,
                      style: AppTextStyle.description,
                    ),
                    TextSpan(
                      text: ' ${context.l10n.login}',
                      style: AppTextStyle.redDescription,
                      mouseCursor: SystemMouseCursors.click,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => context.goNamed(KRoute.login.name),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
