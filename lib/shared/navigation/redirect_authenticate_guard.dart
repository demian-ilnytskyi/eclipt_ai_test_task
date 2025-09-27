part of 'router_go.dart';

FutureOr<String?> Function(BuildContext, GoRouterState)?
_unauthenticationRedirect = (BuildContext context, GoRouterState state) {
  if (context.read<AuthenticationBloc>().state.status !=
      AuthenticationStatus.authenticated) {
    final showedIntro = GetIt.I.get<SharedPrefencesProvider>().getBool(
      IntroCubit.showedIntroKey,
    );
    if (showedIntro ?? false) {
      return '${KRoute.intro.path}${KRoute.login.path}';
    } else {
      return KRoute.intro.path;
    }
  }
  final profilePath = '${KRoute.home.path}${KRoute.profile.path}';
  final messageExist =
      context.read<UserWatcherBloc>().state.userSetting.message == null;
  if (state.fullPath != profilePath) {
    if (messageExist) {
      return profilePath;
    }
  } else {
    if (!messageExist) {
      return KRoute.home.path;
    }
  }
  return null;
};

FutureOr<String?> Function(BuildContext, GoRouterState)?
_authenticationRedirect = (BuildContext context, GoRouterState state) {
  if (context.read<AuthenticationBloc>().state.status ==
      AuthenticationStatus.authenticated) {
    return KRoute.home.path;
  }
  return null;
};
