import 'kts_base_config.dart';

class KtsDevelopmentConfig implements KtsBaseConfig {
  @override
  String get apiHost => "https://localhost:44322";

  @override
  int get maxRetries => 5;

  @override
  String get iosSdkKey => "appl_UAJfetEygapVvzwCCgrzLUlYSEL";

  @override
  String get androidSdkKey => "goog_LyuKmJkmMmePQWoKpArZPwpuclF";

  @override
  String get identityServerApi => "https://kts-prod-identity.azurewebsites.net/";

  @override
  String get identityClient => "kts-mobile";

  @override
  String get identityScopes => "kts-web-api openid profile offline_access";
}