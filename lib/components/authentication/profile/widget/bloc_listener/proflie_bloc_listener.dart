import 'package:exlipt_ai_test_task/components/authentication/profile/bloc/profile_bloc.dart';
import 'package:exlipt_ai_test_task/shared/constants/constants_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProflieBlocListener extends StatelessWidget {
  const ProflieBlocListener({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.formState == ProfileEnum.success) {
          context.goNamed(KRoute.home.name);
        }
      },
      listenWhen: (previous, current) =>
          current.formState != previous.formState,
      child: child,
    );
  }
}
