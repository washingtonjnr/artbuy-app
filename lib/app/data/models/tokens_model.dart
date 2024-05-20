class TokensModel {
  final String accessToken;
  final String refreshToken;

  TokensModel({
    required this.accessToken,
    required this.refreshToken,
  });

  TokensModel copyWith({
    required String accessToken,
    required String refreshToken,
  }) {
    return TokensModel(
      accessToken: this.accessToken,
      refreshToken: this.refreshToken,
    );
  }
}
