class Supermercado {
  String id;
  String nome;
  String endereco;

  Supermercado({
    required this.id,
    required this.nome,
    required this.endereco,
  });

  factory Supermercado.fromJson( Map<String, dynamic> json ) {
    return Supermercado(
      id: json['id'] as String,
      nome: json['nome'] as String,
      endereco: json['cnpj'] as String,
    );
  }

  String getID() => id;
  String getNome() => nome;
  String getEndereco() => endereco;

  void setNome( String novoNome ) => nome = novoNome;
  void setEndereco( String novoEndereco ) => endereco = novoEndereco;

}