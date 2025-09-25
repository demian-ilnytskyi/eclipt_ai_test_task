part of 'router_go.dart';

FutureOr<String?> Function(BuildContext, GoRouterState)?
_authenticationRedirect = (BuildContext context, GoRouterState state) {
  if (context.read<AuthenticationBloc>().state.status !=
      AuthenticationStatus.authenticated) {
    final showedIntro = GetIt.I.get<SharedPrefencesProvider>().getBool(
      showedIntroKey,
    );
    if (showedIntro ?? false) {
      return '${KRoute.intro.path}${KRoute.login.path}';
    } else {
      return KRoute.intro.path;
    }
  }
  return null;
};
