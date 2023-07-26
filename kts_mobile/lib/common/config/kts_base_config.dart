abstract class KtsBaseConfig {
  String get apiHost;
  String get identityServerApi;
  String get identityScopes;
  String get identityClient;
  int get maxRetries;
  String get iosSdkKey => "";
  String get androidSdkKey => "";
}
