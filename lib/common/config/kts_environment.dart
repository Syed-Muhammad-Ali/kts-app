
import 'kts_base_config.dart';
import 'kts_development_config.dart';
import 'kts_production_config.dart';
import 'kts_staging_config.dart';

class KtsEnvironment {
  factory KtsEnvironment() {
    return _singleton;
  }

  late KtsBaseConfig config;
  KtsEnvironment._internal();
  static final KtsEnvironment _singleton = KtsEnvironment._internal();
  static const String development = 'DEVELOPMENT';
  static const String staging = 'STAGING';
  static const String production = 'PRODUCTION';

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  KtsBaseConfig _getConfig(String environment) {
    switch (environment) {
      case KtsEnvironment.production:
        return KtsProductionConfig();
      case KtsEnvironment.staging:
        return KtsStagingConfig();
      default:
        return KtsDevelopmentConfig();
    }
  }
}