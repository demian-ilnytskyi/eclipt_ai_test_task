// ignore_for_file: library_private_types_in_public_api

/// COMMENT: Class has path and name for all screens
class _RouteItem {
  const _RouteItem({required this.path, required this.name});

  final String path;
  final String name;
}

abstract class KRoute {
  static const _RouteItem home = _RouteItem(path: '/', name: 'Home');
  static const _RouteItem login = _RouteItem(path: '/login', name: 'Login');
  static const _RouteItem signUp = _RouteItem(path: '/sign-up', name: 'SignUp');
  static const _RouteItem intro = _RouteItem(path: '/intro', name: 'Intro');
  static const _RouteItem intro2 = _RouteItem(
    path: '/product',
    name: 'Intro Second',
  );
  static const _RouteItem intro3 = _RouteItem(
    path: '/payment',
    name: 'Intro Third',
  );
}
