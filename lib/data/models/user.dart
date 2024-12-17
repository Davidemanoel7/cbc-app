class User {
  String id;
  String nome;
  String email;
  String senha;
  String? fotoPerfil;
  String matricula;
  String? cryptKey;

  User({
    required this.id,
    required this.nome,
    required this.email,
    required this.senha,
    this.fotoPerfil,
    required this.matricula,
    this.cryptKey
  });

  factory User.fromJson( Map<String, dynamic> json ) {
    return User(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      senha: json['senha'],
      fotoPerfil: json['fotoPerfil'] ?? Null,
      matricula: json['matricula'],
      cryptKey: json['cryptKey'] ?? Null
    );
  }

  String getId() => id;

  String getProfileImage() => fotoPerfil!;
  void setProfileImage( String novaImagem ) => fotoPerfil = novaImagem;

  String getNome() => nome;
  void setNome( String novoNome ) => nome = novoNome;
 
  String getEmail() => email;
  String getMatricula() => matricula;
  String getCryptKey() => cryptKey!;
}