import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart';

class IntroBody extends StatelessWidget {
  const IntroBody({
    required this.title,
    required this.description,
    required this.image,
    super.key,
  });
  final String title;
  final String description;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: KPadding.kPaddingSize17,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image,
              KSizedBox.kHeightSizedBox15,
              Text(title, style: AppTextStyle.title),
              KSizedBox.kHeightSizedBox10,
              Text(
                description,
                style: AppTextStyle.body,
                textAlign: TextAlign.center,
              ),
              KSizedBox.kHeightSizedBox24,
            ],
          ),
        ),
      ),
    );
  }
}
