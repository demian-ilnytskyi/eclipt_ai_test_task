import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart';

class IntroBody extends StatelessWidget {
  const IntroBody({
    required this.title,
    required this.description,
    required this.image,
    required this.imagePadding,
    super.key,
  });
  final String title;
  final String description;
  final Image image;
  final EdgeInsets imagePadding;

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
              SizedBox(
                width: double.infinity,
                child: Padding(padding: imagePadding, child: image),
              ),
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
