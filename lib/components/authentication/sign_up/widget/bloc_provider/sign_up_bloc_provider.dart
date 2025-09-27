import 'package:exlipt_ai_test_task/components/authentication/sign_up/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SignUpBlocProvider extends StatelessWidget {
  const SignUpBlocProvider({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<SignUpBloc>(),
      child: child,
    );
  }
}
