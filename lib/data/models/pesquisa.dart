class Pesquisa {
  
  String id;
  String pesquisaID;
  String dataInicio;
  String dataFim;
  bool finalizada;

  Pesquisa({
    required this.id,
    required this.pesquisaID,
    required this.dataInicio,
    required this.dataFim,
    required this.finalizada,
  });

  factory Pesquisa.fromJson( Map<String, dynamic> json ) {
    return Pesquisa(
      id: json['id'] as String,
      pesquisaID: json['pesquisaId'] as String,
      dataFim: json['dataFim'] as String,
      dataInicio: json['dataInicio'] as String,
      finalizada: json['finalizada'] as bool,
    );
  }

  String getId() => id;
  String getPesquisaId() => pesquisaID;

  String getDataInicio() => dataInicio;
  void setNome( String novadataInicio ) => dataInicio = novadataInicio;

  String getDataFim() => dataFim;
  void setMarca(String novaDataFim) => dataFim = novaDataFim;

  bool getStatus() => finalizada;
  void setStatus() => !finalizada;
}