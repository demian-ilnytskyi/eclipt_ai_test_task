import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart';

class AppSaffold extends StatelessWidget {
  const AppSaffold({required this.body, super.key, this.appBar});
  final Widget body;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.white,
      child: SafeArea(
        child: Scaffold(appBar: appBar, body: body),
      ),
    );
  }
}
