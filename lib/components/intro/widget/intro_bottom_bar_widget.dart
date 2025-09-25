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
    late String routeName;
    switch (pageType) {
      case IntroType.first:
        routeName = KRoute.intro2.name;
      case IntroType.second:
        routeName = KRoute.intro3.name;
      case IntroType.third:
        routeName = KRoute.login.name;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KPadding.kPaddingSize9),
      child: Row(
        children: [
          const Expanded(child: SizedBox.shrink()),
          Row(spacing: KPadding.kPaddingSize10, children: paginationList),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => context.goNamed(routeName),
                style: const ButtonStyle(
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(
                      horizontal: KPadding.kPaddingSize10,
                      vertical: KPadding.kPaddingSize3,
                    ),
                  ),
                  alignment: Alignment.centerRight,
                  overlayColor: WidgetStatePropertyAll<Color>(
                    AppColors.lightGrey,
                  ),
                  tapTargetSize: MaterialTapTargetSize.padded,
                ),
                child: Text(
                  context.l10n.next,
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
}
