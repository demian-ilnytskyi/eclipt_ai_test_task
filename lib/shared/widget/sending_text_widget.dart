import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart';

class SendingTextWidget extends StatelessWidget {
  const SendingTextWidget({
    required this.failureText,
    required this.sendingText,
    required this.successText,
    this.showSendingText = false,
    this.showSuccessText = false,
    super.key,
    this.successTextAlign,
  });
  final String? failureText;
  final String? sendingText;
  final bool showSendingText;
  final String? successText;
  final bool showSuccessText;
  final TextAlign? successTextAlign;

  @override
  Widget build(BuildContext context) {
    final sendingTextValue = showSendingText ? sendingText : null;
    final successTextValue = showSuccessText ? successText : null;
    if (failureText == null &&
        sendingTextValue == null &&
        successTextValue == null) {
      return const SizedBox.shrink();
    } else {
      return Padding(
        padding: const EdgeInsets.only(
          right: KPadding.kPaddingSize16,
          left: KPadding.kPaddingSize16,
          top: KPadding.kPaddingSize16,
        ),
        child: Text(
          (failureText ?? sendingTextValue ?? successTextValue)!,
          textAlign: showSuccessText
              ? successTextAlign ?? TextAlign.center
              : TextAlign.center,
          style: failureText != null
              ? AppTextStyle.redDescription
              : AppTextStyle.description,
        ),
      );
    }
  }
}
