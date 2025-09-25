import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart';

abstract class KButtonStyles {
  static const ButtonStyle errorButton = ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(Colors.blueGrey),
    padding: WidgetStatePropertyAll(
      EdgeInsets.only(
        top: KPadding.kPaddingSize8,
        bottom: KPadding.kPaddingSize8,
        left: KPadding.kPaddingSize8,
        right: KPadding.kPaddingSize16,
      ),
    ),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: KBorderRadius.kBorderRadius32),
    ),
  );
}
