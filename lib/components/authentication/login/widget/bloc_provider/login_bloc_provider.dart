import 'package:exlipt_ai_test_task/components/authentication/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class LoginBlocProvider extends StatelessWidget {
  const LoginBlocProvider({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<LoginBloc>(),
      child: child,
    );
  }
}
