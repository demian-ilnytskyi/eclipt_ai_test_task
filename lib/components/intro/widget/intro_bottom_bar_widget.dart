import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroBottomBarWidget extends StatelessWidget {
  const IntroBottomBarWidget({required this.pageType, super.key});
  final IntroType pageType;

  @override
  Widget build(BuildContext context) {
    final paginationList =
        <Widget>[
          const CircleAvatar(
            radius: KSize.kPixel5,
            backgroundColor: AppColors.whiteBlack,
          ),
          const CircleAvatar(
            radius: KSize.kPixel5,
            backgroundColor: AppColors.whiteBlack,
          ),
        ]..insert(
          pageType.value,
          const DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.lightBlack,
              borderRadius: KBorderRadius.kBorderRadius100,
            ),
            child: SizedBox(width: KSize.kPixel40, height: KSize.kPixel8),
          ),
        );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KPadding.kPaddingSize9),
      child: Row(
        children: [
          Expanded(
            child: pageType == IntroType.first
                ? const SizedBox.shrink()
                : Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () => popEvent(context),
                      style: KButtonStyles.introGrey,
                      child: Text(
                        context.l10n.prev,
                        style: AppTextStyle.greySmallButton,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
          ),
          Row(spacing: KPadding.kPaddingSize10, children: paginationList),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => context.goNamed(nextRoute),
                style: KButtonStyles.introRed,
                child: Text(
                  pageType == IntroType.third
                      ? context.l10n.getStarted
                      : context.l10n.next,
                  style: AppTextStyle.redSmallButton,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String get nextRoute {
    switch (pageType) {
      case IntroType.first:
        return KRoute.intro2.name;
      case IntroType.second:
        return KRoute.intro3.name;
      case IntroType.third:
        return KRoute.login.name;
    }
  }

  void popEvent(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      context.goNamed(
        pageType == IntroType.second ? KRoute.intro.name : KRoute.intro2.name,
      );
    }
  }
}
