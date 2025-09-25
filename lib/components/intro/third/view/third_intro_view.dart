import 'package:exlipt_ai_test_task/components/intro/third/widget/body/third_intro_body.dart';
import 'package:exlipt_ai_test_task/components/intro/widget/intro_scaffold.dart';
import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart';

class ThirdIntroScreen extends StatelessWidget {
  const ThirdIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const IntroScaffold(
      pageType: IntroType.third,
      body: ThirdIntroBody(),
    );
  }
}
