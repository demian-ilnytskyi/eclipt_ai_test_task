import 'package:exlipt_ai_test_task/shared/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static const TextStyle title = TextStyle(
    fontSize: 24,
    height: 1.21,
    fontWeight: FontWeight.w800,
    color: AppColors.black,
  );
  static const TextStyle body = TextStyle(
    fontSize: 14,
    height: 1.71,
    fontWeight: FontWeight.w600,
    color: AppColors.grey,
    letterSpacing: 0.28,
  );
  static const TextStyle redSmallButton = TextStyle(
    fontSize: 18,
    height: 1.22,
    fontWeight: FontWeight.w600,
    color: AppColors.red,
  );
  static const TextStyle greySmallButton = TextStyle(
    fontSize: 18,
    height: 1.22,
    fontWeight: FontWeight.w600,
    color: AppColors.blackWhite,
  );
  static const TextStyle description = TextStyle(
    fontSize: 14,
    height: 1.214,
    fontWeight: FontWeight.w400,
    color: AppColors.darkGrey,
  );
  static const TextStyle redDescription = TextStyle(
    fontSize: 14,
    height: 1.214,
    fontWeight: FontWeight.w400,
    color: AppColors.red,
  );
  static const TextStyle redButton = TextStyle(
    fontSize: 20,
    height: 1.2,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
  static const TextStyle field = TextStyle(
    fontSize: 20,
    height: 1.2,
    fontWeight: FontWeight.w400,
    color: AppColors.fieldText,
  );
  static const TextStyle pageTitle = TextStyle(
    fontSize: 36,
    height: 1.194,
    fontWeight: FontWeight.bold,
    color: AppColors.fieldText,
  );
  static const TextStyle whiteTitle = TextStyle(
    fontSize: 24,
    height: 1.208,
    fontWeight: FontWeight.w800,
    color: AppColors.white,
  );
  static const TextStyle greyBody = TextStyle(
    fontSize: 14,
    height: 1.714,
    fontWeight: FontWeight.w600,
    color: AppColors.lightGrey,
    letterSpacing: 0.28,
  );
}
