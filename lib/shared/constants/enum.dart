import 'dart:io';

enum ErrorLevelEnum { fatal, error, info, warning }

enum AuthenticationStatus {
  unknown,
  unauthenticated,
  authenticated;

  bool get isAuthenticated => this == AuthenticationStatus.authenticated;
}

enum PlatformEnum {
  android,
  ios,
  unknown;

  bool get isAndroid => this == PlatformEnum.android;
  bool get isIOS => this == PlatformEnum.ios;
  bool get isUnkown => this == PlatformEnum.unknown;

  static PlatformEnum get getPlatform {
    try {
      if (Platform.isAndroid) {
        return PlatformEnum.android;
      } else if (Platform.isIOS) {
        return PlatformEnum.ios;
      }
      return PlatformEnum.unknown;
    } catch (e) {
      return PlatformEnum.unknown;
    }
  }
}

enum IntroType {
  first(0),
  second(1),
  third(2);

  const IntroType(this.value);

  final int value;
}
