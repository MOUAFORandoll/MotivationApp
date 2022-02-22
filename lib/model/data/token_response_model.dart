class TokenModel {
  String? token;
  String? refreshToken;

  TokenModel({token, resfrehToken});

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      token: json['token'],
      resfrehToken: json['refreshToken'],
    );
  }
}
