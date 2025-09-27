import 'package:exlipt_ai_test_task/shared/constants/dimensions/size_constants.dart';
import 'package:flutter/material.dart';

abstract class KBorderRadius {
  static const kBorderRadius32 = BorderRadius.all(
    Radius.circular(KSize.kRadius32),
  );
  static const kBorderRadius100 = BorderRadius.all(Radius.circular(100));
}
