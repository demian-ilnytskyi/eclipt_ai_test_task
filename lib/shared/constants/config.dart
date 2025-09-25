abstract class Config {
  static const isReleaseMode = bool.fromEnvironment('dart.vm.product');
}
