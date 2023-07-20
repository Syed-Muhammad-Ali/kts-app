import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/identity/models/token.dart';
import 'package:kts_mobile/common/identity/services/authentication.service.dart';
import 'package:kts_mobile/common/identity/services/token.provider.dart';
import 'package:kts_mobile/common/routing/kts_route_generator.dart';

class AppService {
  factory AppService() {
    return _singleton;
  }

  AppService._internal();

  static final AppService _singleton = AppService._internal();

  AccountDto? _loggedInAccount;
  BkUserDto? _loggedInuser;

  BkUserDto? get loggedInuser {
    return _loggedInuser;
  }

  AccountDto? get loggedInAccount {
    return _loggedInAccount;
  }

  Future login(Token token) async {
    await TokenProvider().setToken(token);
    await _setLoggedInUser();
  }

  Future logout() async {
    await TokenProvider().setToken(null);
    _loggedInAccount = null;
    _loggedInuser = null;
  }

  Future updateLoggedInUser() async {
    await _setLoggedInUser();
  }

  // get the token from storage
  // if the token has expired, an attempt to refresh is made
  // if the refresh fails the original expired token is returned
  Future<Token?> retrieveToken() async {
    var token = await TokenProvider().getToken();
    if (token == null) {
      return null;
    }

    if (token.hasExpired()) {
      // token expired attempt refresh
      try {
        token =
            await AuthenticationService().renewAccessToken(token.refreshToken);
      } catch (err) {
        var t = "";
      }
    }

    return token;
  }

  Future<void> _setLoggedInUser() async {
    //load the user object
    //set the logged in user and the logged in account
    var response = await KtsRouteConfigurator.apiClient
        .getAccountReadApi()
        .accountReadGetAccount();
    if (response.data != null) {
      _loggedInAccount = response.data!.account;
      if (response.data!.account != null &&
          response.data!.account!.user != null) {
        _loggedInuser = response.data!.account!.user;
      } else {
        throw Exception("Failed to load account user");
      }
    } else {
      throw Exception("Failed to load account user");
    }
  }
}
