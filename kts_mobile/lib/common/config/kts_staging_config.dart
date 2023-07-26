// ignore_for_file: override_on_non_overriding_member

import 'kts_base_config.dart';

class KtsStagingConfig implements KtsBaseConfig {
  @override
  // String get apiHost => "http://127.0.0.1:5000";
  String get apiHost => "https://kts-prod-api.azurewebsites.net";

  @override
  String get apiIdentityServer => "";

  @override
  int get maxRetries => 5;

  @override
  String get iosSdkKey => "appl_UAJfetEygapVvzwCCgrzLUlYSEL";

  @override
  String get androidSdkKey => "";

  @override
  String get identityServerApi => throw UnimplementedError();

  @override
  String get identityClient => throw UnimplementedError();

  @override
  String get identityScopes => throw UnimplementedError();
}
