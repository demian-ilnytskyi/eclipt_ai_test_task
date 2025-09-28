import 'package:exlipt_ai_test_task/components/authentication/login/bloc/login_bloc.dart';
import 'package:exlipt_ai_test_task/components/authentication/widget/password_field_widget.dart';
import 'package:exlipt_ai_test_task/shared/models/failure_model/failure_extension.dart';
import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: KPadding.kPaddingSize26,
        left: KPadding.kPaddingSize32,
      ),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KSizedBox.kHeightSizedBox19,
            Text(
              context.l10n.welcomeBack,
              style: AppTextStyle.pageTitle,
              textAlign: TextAlign.start,
            ),
            KSizedBox.kHeightSizedBox33,
            TextFieldWidget(
              onChanged: (value) =>
                  context.read<LoginBloc>().add(LoginEvent.emailUpdated(value)),
              labelText: context.l10n.email,
              prefixIcon: KIcon.person,
              keyboardType: TextInputType.emailAddress,
              showErrorText: state.formState == LoginEnum.invalidData,
              errorText: state.email.error?.value(context),
            ),
            KSizedBox.kHeightSizedBox31,
            PasswordFieldWidget(
              onChanged: (value) => context.read<LoginBloc>().add(
                LoginEvent.passwordUpdated(value),
              ),
              labelText: context.l10n.password,
              showErrorText: state.formState == LoginEnum.invalidData,
              errorText: state.password.error.value(context),
            ),
            KSizedBox.kHeightSizedBox31,
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => context.read<LoginBloc>().add(
                  const LoginEvent.loginSubmitted(),
                ),
                style: KButtonStyles.authentication,
                child: Text(context.l10n.login, style: AppTextStyle.redButton),
              ),
            ),
            SendingTextWidget(
              failureText: state.failure?.value(context),
              sendingText: context.l10n.signingUpWait,
              successText: null,
              showSendingText: state.formState == LoginEnum.procesing,
            ),
            KSizedBox.kHeightSizedBox21,
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: context.l10n.createAnAccountDescription,
                      style: AppTextStyle.description,
                    ),
                    TextSpan(
                      text: ' ${context.l10n.signUp}',
                      style: AppTextStyle.redDescription,
                      mouseCursor: SystemMouseCursors.click,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => context.goNamed(KRoute.signUp.name),
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
