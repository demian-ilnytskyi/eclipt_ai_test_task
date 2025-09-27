import 'package:exlipt_ai_test_task/components/authentication/sign_up/widget/bloc_provider/sign_up_bloc_provider.dart';
import 'package:exlipt_ai_test_task/components/authentication/sign_up/widget/body/sign_up_body.dart';
import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppSaffold(body: SignUpBlocProvider(child: SignUpBody()));
  }
}
