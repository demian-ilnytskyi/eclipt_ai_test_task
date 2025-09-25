import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetIt.I.get<AuthenticationBloc>()),
      ],
      child: const AppWidget(),
    );
  }
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeAnimationDuration: Duration.zero,
      theme: themeData,
      // scrollBehavior: CustomScrollBehavior(),
      localizationsDelegates: locale,
      locale: const Locale('en'),
      supportedLocales: supportedLocales,
      routerConfig: router,
    );
  }
}
