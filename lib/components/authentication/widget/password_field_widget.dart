import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart';

class PasswordFieldWidget extends StatefulWidget {
  const PasswordFieldWidget({
    required this.onChanged,
    required this.labelText,
    super.key,
    this.errorText,
    this.controller,
    this.focusNode,
    this.showErrorText,
    // this.disposeFocusNode,
    this.enabled,
    this.constraints,
  });
  final void Function(String) onChanged;
  final String? errorText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? showErrorText;
  // final bool? disposeFocusNode;
  final String labelText;
  final bool? enabled;
  final BoxConstraints? constraints;

  @override
  State<PasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  late bool obscurePassword;

  @override
  void initState() {
    obscurePassword = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      onChanged: widget.onChanged,
      errorText: widget.errorText,
      labelText: widget.labelText,
      enabled: widget.enabled,
      controller: widget.controller,
      suffixIcon: IconButton(
        icon: obscurePassword ? KIcon.eye : KIcon.eyeOff,
        onPressed: () => setState(() => obscurePassword = !obscurePassword),
      ),
      prefixIcon: KIcon.lock,
      focusNode: widget.focusNode,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscurePassword,
      showErrorText: widget.showErrorText,
      constraints: widget.constraints,
    );
  }
}
