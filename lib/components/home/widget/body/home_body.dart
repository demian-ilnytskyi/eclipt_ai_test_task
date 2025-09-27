import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserWatcherBloc, UserWatcherState>(
      builder: (context, state) {
        return Center(
          child: Column(
            children: [
              KSizedBox.kHeightSizedBox40,
              Text(context.l10n.testCompleted, style: AppTextStyle.whiteTitle),
              KSizedBox.kHeightSizedBox10,
              Text(
                '${context.l10n.youAreSignedInAs}\n${state.user.email}',
                style: AppTextStyle.greyBody,
                textAlign: TextAlign.center,
              ),
              KSizedBox.kHeightSizedBox10,
              Text(
                '${context.l10n.yourTextIs}\n${state.userSetting.message}',
                style: AppTextStyle.greyBody,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
