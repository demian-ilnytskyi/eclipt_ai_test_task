// ignore: lines_longer_than_80_chars
// ignore_for_file: library_private_types_in_public_api, unused_element_parameter

import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart'
    show
        Color,
        Icon,
        IconButton,
        IconData,
        Icons,
        Key,
        Shadow,
        TextDirection,
        Widget;
import 'package:material_symbols_icons/symbols.dart';

class _KIcon extends Icon {
  const _KIcon(
    super.icon, {
    super.key,
    super.weight = 700,
    super.fill,
    super.size = KSize.kPixel24,
    super.color = AppColors.iconColor,
    super.grade,
  });
}

extension IconExtension on Icon {
  Icon copyWith({
    Key? key,
    IconData? icon,
    double? size,
    double? fill,
    double? weight,
    double? grade,
    double? opticalSize,
    Color? color,
    List<Shadow>? shadows,
    String? semanticLabel,
    TextDirection? textDirection,
    bool? applyTextScaling,
  }) {
    return Icon(
      icon ?? this.icon,
      key: key ?? this.key,
      size: size ?? this.size,
      fill: fill ?? this.fill,
      weight: weight ?? this.weight,
      grade: grade ?? this.grade,
      opticalSize: opticalSize ?? this.opticalSize,
      color: color ?? this.color,
      shadows: shadows ?? this.shadows,
      semanticLabel: semanticLabel ?? this.semanticLabel,
      textDirection: textDirection ?? this.textDirection,
      applyTextScaling: applyTextScaling ?? this.applyTextScaling,
    );
  }
}

abstract class KIcon {
  static const person = _KIcon(Symbols.person, fill: 1);
  static const lock = _KIcon(Symbols.lock, fill: 1);
  static const eyeOff = _KIcon(Symbols.visibility_off);
  static const eye = _KIcon(Symbols.remove_red_eye);
}
