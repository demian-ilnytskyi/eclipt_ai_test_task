import 'package:exlipt_ai_test_task/components/intro/bloc/intro_cubit.dart';
import 'package:exlipt_ai_test_task/components/intro/widget/bloc_provider/intro_bloc_provider.dart';
import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class IntroScaffold extends StatelessWidget {
  const IntroScaffold({required this.pageType, required this.body, super.key});
  final IntroType pageType;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return IntroBlocProvider(
      child: AppSaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: KPadding.kPaddingSize17,
          title: _AppBarTitle(pageType: pageType),
        ),
        body: body,
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({required this.pageType});
  final IntroType pageType;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: (pageType.value + 1).toString(),
                style: AppTextStyle.blackSmallButton,
              ),
              const TextSpan(text: '/3', style: AppTextStyle.greySmallButton),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            context.read<IntroCubit>().finish();
            context.goNamed(KRoute.signUp.name);
          },
          style: KButtonStyles.introSkip,
          child: Text(context.l10n.skip, style: AppTextStyle.blackSmallButton),
        ),
      ],
    );
  }
}
