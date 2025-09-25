import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorBodyWidget extends StatelessWidget {
  const ErrorBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () => context.goNamed(KRoute.home.name),
        style: KButtonStyles.errorButton,
        child: Text(
          context.l10n.errorMessage,
          style: const TextStyle(color: Colors.white, fontSize: KSize.kFont16),
        ),
      ),
    );
  }
}
