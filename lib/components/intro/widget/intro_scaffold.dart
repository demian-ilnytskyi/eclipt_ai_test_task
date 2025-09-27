import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroScaffold extends StatelessWidget {
  const IntroScaffold({required this.pageType, required this.body, super.key});
  final IntroType pageType;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            titleSpacing: KPadding.kPaddingSize17,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: (pageType.value + 1).toString(),
                        style: AppTextStyle.blackSmallButton,
                      ),
                      const TextSpan(
                        text: '/3',
                        style: AppTextStyle.greySmallButton,
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () => context.goNamed(KRoute.login.name),
                  style: const ButtonStyle(
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(
                        horizontal: KPadding.kPaddingSize10,
                        vertical: KPadding.kPaddingSize3,
                      ),
                    ),
                    overlayColor: WidgetStatePropertyAll<Color>(
                      AppColors.lightGrey,
                    ),
                  ),
                  child: Text(
                    context.l10n.skip,
                    style: AppTextStyle.blackSmallButton,
                  ),
                ),
              ],
            ),
          ),
          body: body,
        ),
      ),
    );
  }
}
