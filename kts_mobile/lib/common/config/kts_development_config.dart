import 'kts_base_config.dart';

class KtsDevelopmentConfig implements KtsBaseConfig {
  @override
  // String get apiHost =>  "http://127.0.0.1:5000";
   String get apiHost =>  "https://kts-php-staging.azurewebsites.net";
  // String get apiHost =>  "https://kts-prod-api.azurewebsites.net";
  // String get apiHost =>  "https://kts-stage-api.azurewebsites.net";
  // "https://127.0.0.1:44322";

  @override
  int get maxRetries => 5;

  @override
  String get iosSdkKey => "appl_UAJfetEygapVvzwCCgrzLUlYSEL";

  @override
  String get androidSdkKey => "goog_LyuKmJkmMmePQWoKpArZPwpuclF";

  @override
  // String get identityServerApi => "https://kts-prod-identity.azurewebsites.net/";
  String get identityServerApi => "https://kts-php-staging.azurewebsites.net/";
  // String get identityServerApi => "https://kts-stage-identity.azurewebsites.net";

  @override
  String get identityClient => "kts-mobile";

  @override
  String get identityScopes => "kts-web-api openid profile offline_access";
}
