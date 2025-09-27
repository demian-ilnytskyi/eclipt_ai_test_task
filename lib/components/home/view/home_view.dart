import 'package:exlipt_ai_test_task/components/home/widget/body/home_body.dart';
import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: SafeArea(
        child: Scaffold(
          body: const HomeBody(),
          backgroundColor: Colors.transparent,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: KPadding.kPaddingSize48,
            ),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => context.read<AuthenticationBloc>().add(
                  AuthenticationLogoutRequested(),
                ),
                style: KButtonStyles.authentication,
                child: Text(context.l10n.logOut, style: AppTextStyle.redButton),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
