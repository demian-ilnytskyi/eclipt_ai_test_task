enum ErrorLevelEnum { fatal, error, info, warning }

enum AuthenticationStatus {
  unknown,
  unauthenticated,
  authenticated;

  bool get isAuthenticated => this == AuthenticationStatus.authenticated;
}
