import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    required this.onChanged,
    required this.labelText,
    this.isRequired,
    this.hintText,
    this.textAlign,
    super.key,
    this.errorText,
    this.keyboardType,
    this.maxLines,
    this.maxLength,
    this.contentPadding,
    this.border,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.fillColor,
    this.onEditingCompleted,
    this.onSubmitted,
    this.enabled = true,
    this.focusNode,
    this.enabledBorder,
    this.focusedBorder,
    this.errorMaxLines = 3,
    this.readOnly,
    // this.disposeFocusNode = true,
    this.expands = false,
    this.minLines,
    this.hintStyle,
    // this.text,
    this.showErrorText,
    this.labelTextStyle,
    this.textStyle,
    this.cursor,
    this.disabledBorder,
    this.floatingLabelBehavior,
    this.description,
    this.textInputAction,
    this.focusColor,
    this.hoverColor,
    this.constraints,
  });
  final TextAlign? textAlign;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final String? errorText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final EdgeInsetsGeometry? contentPadding;
  final OutlineInputBorder? border;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final Color? fillColor;
  final void Function()? onEditingCompleted;
  final void Function(String)? onSubmitted;
  final bool? enabled;
  final FocusNode? focusNode;
  final OutlineInputBorder? enabledBorder;
  final OutlineInputBorder? disabledBorder;
  final InputBorder? focusedBorder;
  final int? errorMaxLines;
  final bool? readOnly;
  // final bool disposeFocusNode;
  final bool expands;
  final String? labelText;
  final TextStyle? hintStyle;
  // final String? text;
  final bool? showErrorText;
  final TextStyle? labelTextStyle;
  final TextStyle? textStyle;
  final MouseCursor? cursor;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final String? description;
  final TextInputAction? textInputAction;
  final bool? isRequired;
  final Color? focusColor;
  final Color? hoverColor;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: TextField(
        expands: expands,
        focusNode: focusNode,
        enabled: enabled,
        readOnly: readOnly ?? false,
        onSubmitted: onSubmitted,
        onEditingComplete: onEditingCompleted,
        obscureText: obscureText,
        autocorrect: !obscureText,
        controller: //controller ??
            controller,
        maxLines: expands ? null : maxLines ?? 1,
        minLines: expands ? null : minLines ?? 1,
        maxLength: maxLength,
        keyboardType: keyboardType ?? TextInputType.text,
        textInputAction: textInputAction ?? TextInputAction.done,
        textAlign: textAlign ?? TextAlign.start,
        style: textStyle ?? AppTextStyle.labelText,
        // context.theme.textTheme.headlineSmall,
        onChanged: onChanged,
        mouseCursor: cursor,
        decoration: KWidgetTheme.inputDecoration.copyWith(
          hintStyle: hintStyle,
          contentPadding:
              contentPadding ??
              (const EdgeInsets.symmetric(
                horizontal: KPadding.kPaddingSize10,
                vertical: KPadding.kPaddingSize16,
              )),
          labelText: labelText,
          constraints: constraints,
          border: border,
          enabledBorder:
              enabledBorder ?? KWidgetTheme.outlineInputBorderEnabled,
          hoverColor: hoverColor,
          focusColor: focusColor,
          focusedErrorBorder: border,
          fillColor: fillColor,
          hintText: hintText,
          errorText: showErrorText ?? true ? errorText : null,
          suffixIcon: suffixIcon,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
              top: KPadding.kPaddingSize16,
              bottom: KPadding.kPaddingSize16,
              left: KPadding.kPaddingSize10,
              right: KPadding.kPaddingSize7,
            ),
            child: prefixIcon,
          ),
          prefixIconConstraints: const BoxConstraints(
            minHeight: KSize.kPixel56,
            maxWidth: KSize.kPixel40,
          ),
          errorMaxLines: errorMaxLines,
          labelStyle: labelTextStyle,
          disabledBorder: disabledBorder,
          floatingLabelBehavior: floatingLabelBehavior,
          helperText: description,
          helperStyle: AppTextStyle.body,
        ),
      ),
    );
  }
}
