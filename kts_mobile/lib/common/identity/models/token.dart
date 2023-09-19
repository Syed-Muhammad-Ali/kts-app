class Token {
  late String accessToken;
  late DateTime expiresIn;
  late String tokenType;
  // late String refreshToken;
  // late String scope;

  Token.fromApiJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    expiresIn = DateTime.now().add(Duration(seconds: json['expires_in']));
    tokenType = json['token_type'];
    // refreshToken = json['refresh_token'];
    // scope = json['scope'];
  }

  Token.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    expiresIn = DateTime.fromMillisecondsSinceEpoch(json['expiresIn']);
    tokenType = json['tokenType'];
    // refreshToken = json['refreshToken'];
    // scope = json['scope'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['expiresIn'] = this.expiresIn.millisecondsSinceEpoch;
    data['tokenType'] = this.tokenType;
    // data['refreshToken'] = this.refreshToken;
    // data['scope'] = this.scope;
    return data;
  }

  bool hasExpired() {
    return expiresIn.microsecondsSinceEpoch <
        DateTime.now().microsecondsSinceEpoch;
  }
}
