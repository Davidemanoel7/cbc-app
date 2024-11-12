
import 'dart:ffi';

class Item {
  
  String id;
  String nome;
  String marca;
  String descricao;
  Float preco;
  String? imagem;

  Item({
    required this.id,
    required this.nome,
    required this.marca,
    required this.descricao,
    required this.preco,
    this.imagem
  });

  factory Item.fromJson( Map<String, dynamic> json ) {
    return Item(
      id: json['id'] as String,
      nome: json['nome'] as String,
      marca: json['marca'] as String,
      descricao: json['descricao'] as String,
      preco: json['preco'] as Float,
      imagem: json['imagem'] ?? ''
    );
  }

  String getId() => id;

  String getNome() => nome;
  void setNome( String novoNome ) => nome = novoNome;

  String getMarca() => marca;
  void setMarca(String novaMarca) => marca = novaMarca;

  String getDesc() => descricao;
  void setDesc( novaDescr ) => descricao = novaDescr;

  Float getPreco() => preco;
  void setPreco( novoPreco ) => preco = novoPreco;

  String getImagem() => imagem ?? '';
  void setImagem( String novaImagem ) => imagem = novaImagem;
}