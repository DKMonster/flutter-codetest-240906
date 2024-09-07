enum Flavor {
  production,
  staging,
  development,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.production:
        return 'CodeTest';
      case Flavor.staging:
        return 'CodeTest Staging';
      case Flavor.development:
        return 'CodeTest Development';
      default:
        return 'CodeTest';
    }
  }
}
