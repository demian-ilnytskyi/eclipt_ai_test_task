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
  static const ButtonStyle introRed = ButtonStyle(
    padding: WidgetStatePropertyAll(
      EdgeInsets.symmetric(
        horizontal: KPadding.kPaddingSize10,
        vertical: KPadding.kPaddingSize3,
      ),
    ),
    alignment: Alignment.centerRight,
    overlayColor: WidgetStatePropertyAll<Color>(AppColors.lightGrey),
  );
  static const ButtonStyle introGrey = ButtonStyle(
    padding: WidgetStatePropertyAll(
      EdgeInsets.symmetric(
        horizontal: KPadding.kPaddingSize10,
        vertical: KPadding.kPaddingSize3,
      ),
    ),
    alignment: Alignment.centerRight,
    overlayColor: WidgetStatePropertyAll<Color>(AppColors.lightGrey),
  );
  static const ButtonStyle introSkip = ButtonStyle(
    padding: WidgetStatePropertyAll(
      EdgeInsets.symmetric(
        horizontal: KPadding.kPaddingSize10,
        vertical: KPadding.kPaddingSize3,
      ),
    ),
    overlayColor: WidgetStatePropertyAll<Color>(AppColors.lightGrey),
  );
  static const ButtonStyle authentication = ButtonStyle(
    padding: WidgetStatePropertyAll(EdgeInsets.all(KPadding.kPaddingSize16)),
    backgroundColor: WidgetStatePropertyAll(AppColors.red),
    overlayColor: WidgetStatePropertyAll<Color>(AppColors.lightRed),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: KBorderRadius.kBorderRadius4),
    ),
  );
}
