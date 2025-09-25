import 'package:exlipt_ai_test_task/components/intro/widget/intro_body.dart';
import 'package:exlipt_ai_test_task/components/intro/widget/intro_bottom_bar_widget.dart';
import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart';

class ThirdIntroBody extends StatelessWidget {
  const ThirdIntroBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntroBody(
          title: context.l10n.thirdIntroTitle,
          description: context.l10n.thirdIntroDescription,
          image: KImage.introThirdImage,
        ),
        const IntroBottomBarWidget(pageType: IntroType.third),
      ],
    );
  }
}
