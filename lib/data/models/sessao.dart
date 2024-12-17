class Sessao {
  String id, userId, acessToken, refreshToken;

  Sessao({
    required this.id,
    required this.userId,
    required this.acessToken,
    required this.refreshToken
  });

  factory Sessao.fromJson( Map<String, dynamic> json ) {
    return Sessao(
      id: json['id'],
      userId: json['userId'],
      acessToken: json['acessToken'],
      refreshToken: json['refreshToken']
    );
  }

  String get getUserId => userId;
  String get getAcessToken => acessToken;
  String get getRefreshToken => refreshToken;
}