import 'package:exlipt_ai_test_task/components/intro/widget/intro_body.dart';
import 'package:exlipt_ai_test_task/components/intro/widget/intro_bottom_bar_widget.dart';
import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart';

class SecondIntroBody extends StatelessWidget {
  const SecondIntroBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntroBody(
          title: context.l10n.secondIntroTitle,
          description: context.l10n.secondIntroDescription,
          image: KImage.introSecondImage,
          imagePadding: const EdgeInsets.only(
            bottom: KPadding.kPaddingSize34,
            top: KPadding.kPaddingSize48,
          ),
        ),
        const IntroBottomBarWidget(pageType: IntroType.second),
      ],
    );
  }
}
