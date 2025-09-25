// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart'
    show Color, Icon, IconButton, IconData, Key, Shadow, TextDirection, Widget;

class _KIcon extends Icon {
  const _KIcon(
    super.icon, {
    super.key,
    super.weight = 200,
    super.fill,
    super.size = 24,

    /// TODO: Change
    super.color,
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

abstract class KIcon {}
