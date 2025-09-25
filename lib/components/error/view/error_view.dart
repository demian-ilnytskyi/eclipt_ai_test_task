import 'package:exlipt_ai_test_task/components/error/error.dart';
import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            context.l10n.errorTitle,
            style: const TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: const ErrorBodyWidget(),
    );
  }
}
