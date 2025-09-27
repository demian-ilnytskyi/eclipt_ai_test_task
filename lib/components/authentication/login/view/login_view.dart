import 'package:exlipt_ai_test_task/components/authentication/login/widget/bloc_provider/login_bloc_provider.dart';
import 'package:exlipt_ai_test_task/components/authentication/login/widget/body/login_body.dart';
import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppSaffold(body: LoginBlocProvider(child: LoginBody()));
  }
}
