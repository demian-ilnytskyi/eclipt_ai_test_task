import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart';

abstract class KWidgetTheme {
  static const boxDecorationCircular = BoxDecoration(
    color: AppColors.lightBlack,
    borderRadius: KBorderRadius.kBorderRadius100,
  );

  static const outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.grey),
    borderRadius: KBorderRadius.kBorderRadius10,
  );
  static const outlineInputBorderEnabled = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.grey),
    borderRadius: KBorderRadius.kBorderRadius10,
  );
  static const outlineInputBorderDisabled = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.lightGrey),
    borderRadius: KBorderRadius.kBorderRadius10,
  );
  static const outlineInputBorderFocused = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.fieldText),
    borderRadius: KBorderRadius.kBorderRadius10,
  );
  static const outlineInputBorderErrorFocused = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.red),
    borderRadius: KBorderRadius.kBorderRadius10,
  );
  static const outlineInputBorderError = OutlineInputBorder(
    borderRadius: KBorderRadius.kBorderRadius10,
  );

  static const inputDecoration = InputDecoration(
    hintStyle: AppTextStyle.labelField,
    contentPadding: EdgeInsets.symmetric(
      horizontal: KPadding.kPaddingSize10,
      vertical: KPadding.kPaddingSize16,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    border: outlineInputBorder,
    enabledBorder: outlineInputBorderEnabled,
    disabledBorder: outlineInputBorderDisabled,
    focusedBorder: outlineInputBorderFocused,
    focusedErrorBorder: outlineInputBorderErrorFocused,
    filled: true,
    fillColor: AppColors.fieldFill,
    labelStyle: AppTextStyle.labelField,
    alignLabelWithHint: true,
    errorStyle: AppTextStyle.errorField,
    hoverColor: AppColors.lightGrey,
    errorBorder: outlineInputBorderError,
  );
}
