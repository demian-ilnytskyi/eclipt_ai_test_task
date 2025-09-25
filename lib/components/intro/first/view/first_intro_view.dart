import 'package:exlipt_ai_test_task/components/intro/first/widget/body/first_intro_body.dart';
import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart';

class FirstIntroScreen extends StatelessWidget {
  const FirstIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: '1', style: AppTextStyle.blackSmallButton),
                    TextSpan(text: '/3', style: AppTextStyle.greySmallButton),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: const FirstIntroBody(),
      ),
    );
  }
}
