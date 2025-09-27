import 'package:exlipt_ai_test_task/components/intro/bloc/intro_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class IntroBlocProvider extends StatelessWidget {
  const IntroBlocProvider({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<IntroCubit>(),
      child: child,
    );
  }
}
