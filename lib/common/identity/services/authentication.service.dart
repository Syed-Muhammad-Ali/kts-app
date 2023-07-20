import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kts_mobile/common/config/kts_environment.dart';
import 'package:kts_mobile/common/exceptions/unauthorised.exception.dart';
import 'package:kts_mobile/common/identity/invalid-credentials.exception.dart';
import 'package:kts_mobile/common/identity/models/token.dart';

class AuthenticationService {
  factory AuthenticationService() {
    return _singleton;
  }

  AuthenticationService._internal();
  static final AuthenticationService _singleton =
      AuthenticationService._internal();

  Future<Token> getAccessToken(String username, String password) async {
    final response = await http.post(
        Uri.parse('${KtsEnvironment().config.identityServerApi}/connect/token'),
        headers: _getRequestHeaders(),
        body: await _getResourceOwnerBody(username, password));

    return Token.fromApiJson(_handleResponse(response));
  }

  Future<Token?> renewAccessToken(refreshToken) async {
    final response = await http.post(
        Uri.parse('${KtsEnvironment().config.identityServerApi}/connect/token'),
        headers: _getRequestHeaders(),
        body: await _getRefreshTokenBody(refreshToken));

    return Token.fromApiJson(_handleResponse(response));
  }

  dynamic _getRequestHeaders() {
    return {"content-type": "application/x-www-form-urlencoded"};
  }

  Future<dynamic> _getRefreshTokenBody(String refreshToken) async {
    return {
      "grant_type": "refresh_token",
      "scope": KtsEnvironment().config.identityScopes,
      "client_id": KtsEnvironment().config.identityClient,
      "refresh_token": refreshToken
    };
  }

  Future<dynamic> _getResourceOwnerBody(
      String username, String password) async {
    return {
      "grant_type": "password",
      "scope": KtsEnvironment().config.identityScopes,
      "client_id": KtsEnvironment().config.identityClient,
      "username": username,
      "password": password
    };
  }

  static dynamic _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson;
        if (response.body != "") {
          responseJson = json.decode(response.body.toString());
        }
        return responseJson;
      case 400:
        var error = json.decode(response.body);
        if (error["error"] == "invalid_grant") {
          throw InvalidCredentialsException(error["description)"]);
        } else {
          throw Exception(response.body.toString());
        }
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw Exception("Unkown response type");
    }
  }
}
