import 'package:dio/dio.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/config/kts_environment.dart';
import 'package:kts_mobile/common/identity/services/token.provider.dart';

Dio createDio(BaseOptions baseConfiguration) {
  var dio = Dio(baseConfiguration);
  dio.interceptors.addAll([
    AppendJwtInterceptor(),
    UnAuthroisedInterceptor(dio)
    //NetworkConnectionCheckInterceptor(),
    // interceptor to retry failed requests
    // interceptor to add bearer token to requests
    // interceptor to refresh access tokens
    // interceptor to log requests/responses
    // etc.
  ]);

  return dio;
}

/// Creates Dio Options for initializing a Dio client.
///
/// [baseUrl] Base url for the configuration
/// [connectionTimeout] Timeout when sending data
/// [connectionReadTimeout] Timeout when receiving data
BaseOptions createDioOptions(
    String baseUrl, int connectionTimeout, int connectionReadTimeout) {
  return BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: Duration(seconds: connectionTimeout),
    receiveTimeout: Duration(seconds: connectionReadTimeout),
  );
}

/// Creates an instance of the backend API with default options.
KtsBookingApi createApi() {
  final options =
      createDioOptions(KtsEnvironment().config.apiHost, 50000, 50000);
  final dio = createDio(options);

  initializeDateFormatting('en_GB', null);
  return KtsBookingApi(dio: dio);
}

class NetworkConnectionCheckInterceptor extends Interceptor {
  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    handler.resolve(Response<dynamic>(
        data: true, requestOptions: RequestOptions(path: "")));
  }
}

class AppendJwtInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!options.headers.containsKey("Authroisation")) {
      var token = await TokenProvider().getToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer ${token.accessToken}';
      }
    }
    handler.next(options);
  }
}

class UnAuthroisedInterceptor extends Interceptor {
  final Dio dio;
  UnAuthroisedInterceptor(this.dio);
  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response != null && err.response!.statusCode == 401) {
      var token = await TokenProvider().getToken();
      if (token != null) {
        // token =
        //     await AuthenticationService().renewAccessToken(token.refreshToken);
        await TokenProvider().setToken(token);
        return handler.resolve(await _retry(err.requestOptions));
      }
    } else {
      handler.next(err);
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
