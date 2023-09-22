class Auth {
  String accessToken;
  String refreshToken;
  String userFullName;
  Auth(
      {required this.accessToken,
      required this.refreshToken,
      required this.userFullName});

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      accessToken: json['accessToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
      userFullName: json['userFullName'] ?? '',
    );
  }
}
