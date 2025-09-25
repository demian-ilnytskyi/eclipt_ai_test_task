import 'package:exlipt_ai_test_task/components/intro/second/widget/body/second_intro_body.dart';
import 'package:exlipt_ai_test_task/components/intro/widget/intro_scaffold.dart';
import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart';

class SecondIntroScreen extends StatelessWidget {
  const SecondIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const IntroScaffold(
      pageType: IntroType.second,
      body: SecondIntroBody(),
    );
  }
}
