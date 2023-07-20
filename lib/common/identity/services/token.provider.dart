import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kts_mobile/common/identity/models/token.dart';

class TokenProvider {
  factory TokenProvider() {
    return _singleton;
  }

  TokenProvider._internal();
  static final TokenProvider _singleton = TokenProvider._internal();
  static const String _accountName = "KtsBookKeepingApp";
  final _storage = const FlutterSecureStorage();

  Token? _token;

  Future<Token?> getToken() async {
    if (_token == null) {
      _token = await _retrieveToken();
    }
    return _token;
  }

  Future setToken(Token? token) async {
    if (token != null) {
      await _storeToken(token);
    } else {
      await _removeToken();
    }

    _token = token;
  }

  Future<void> _storeToken(Token token) async {
    await _storage.write(
      key: "token",
      value: jsonEncode(token.toJson()),
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
  }

  Future<void> _removeToken() async {
    await _storage.delete(
      key: "token",
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
  }

  Future<Token?> _retrieveToken() async {
    var value = await _storage.read(
      key: "token",
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );

    if (value != null && value != "") {
      return Token.fromJson(jsonDecode(value));
    }

    return null;
  }

  IOSOptions _getIOSOptions() => IOSOptions(
        accountName: _accountName,
      );

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
}
