import 'package:exlipt_ai_test_task/components/intro/widget/intro_body.dart';
import 'package:exlipt_ai_test_task/components/intro/widget/intro_bottom_bar_widget.dart';
import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart';

class FirstIntroBody extends StatelessWidget {
  const FirstIntroBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntroBody(
          title: context.l10n.firstIntroTitle,
          description: context.l10n.firstIntroDescription,
          image: KImage.introFirstImage,
          imagePadding: const EdgeInsets.only(
            bottom: KPadding.kPaddingSize15,
            right: KPadding.kPaddingSize20,
            left: KPadding.kPaddingSize20,
          ),
        ),
        const IntroBottomBarWidget(pageType: IntroType.first),
      ],
    );
  }
}
