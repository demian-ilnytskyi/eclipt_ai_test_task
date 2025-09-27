import 'package:exlipt_ai_test_task/components/authentication/profile/bloc/profile_bloc.dart';
import 'package:exlipt_ai_test_task/components/authentication/profile/widget/bloc_listener/proflie_bloc_listener.dart';
import 'package:exlipt_ai_test_task/shared/models/failure_model/failure_extension.dart';
import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ProflieBlocListener(
      child: Padding(
        padding: const EdgeInsets.only(
          right: KPadding.kPaddingSize26,
          left: KPadding.kPaddingSize32,
        ),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KSizedBox.kHeightSizedBox19,
              Text(
                context.l10n.setUpAccount,
                style: AppTextStyle.pageTitle,
                textAlign: TextAlign.start,
              ),
              KSizedBox.kHeightSizedBox33,
              TextFieldWidget(
                onChanged: (value) => context.read<ProfileBloc>().add(
                  ProfileEvent.messageUpdated(value),
                ),
                labelText: context.l10n.enterAnyText,
                prefixIcon: KIcon.person,
                showErrorText: state.formState == ProfileEnum.invalidData,
                errorText: state.message.error?.value(context),
              ),
              KSizedBox.kHeightSizedBox31,
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => context.read<ProfileBloc>().add(
                    const ProfileEvent.save(),
                  ),
                  style: KButtonStyles.authentication,
                  child: Text(
                    context.l10n.finish,
                    style: AppTextStyle.redButton,
                  ),
                ),
              ),
              SendingTextWidget(
                failureText: state.failure?.value(context),
                sendingText: context.l10n.changesSendInProgress,
                successText: null,
                showSendingText: state.formState == ProfileEnum.procesing,
              ),
              KSizedBox.kHeightSizedBox21,
            ],
          ),
        ),
      ),
    );
  }
}
