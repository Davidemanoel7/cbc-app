
import 'dart:ffi';

class Item {
  
  String id;
  String nome;
  String marca;
  String descricao;
  String? imagem;

  Item({
    required this.id,
    required this.nome,
    required this.marca,
    required this.descricao,
    this.imagem
  });

  factory Item.fromJson( Map<String, dynamic> json ) {
    return Item(
      id: json['id'] as String,
      nome: json['nome'] as String,
      marca: json['marca'] as String,
      descricao: json['descricao'] as String,
      imagem: json['imagem'] ?? ''
    );
  }

  String get getId => id;

  String get getNome => nome;
  void setNome( String novoNome ) => nome = novoNome;

  String get getMarca => marca;
  void setMarca(String novaMarca) => marca = novaMarca;

  String get getDesc => descricao;
  void setDesc( novaDescr ) => descricao = novaDescr;

  String get getImagem => imagem ?? '';
  void setImagem( String novaImagem ) => imagem = novaImagem;
}