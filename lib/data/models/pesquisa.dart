import 'dart:ffi';

class Pesquisa {
  
  String id;
  String nome;
  String dataInicio;
  String dataFim;
  bool finalizada;
  
  Pesquisa({
    required this.id,
    required this.nome,
    required this.dataInicio,
    required this.dataFim,
    required this.finalizada,
  });

  Pesquisa getInstance() {
    DateTime now = DateTime.now();

    return Pesquisa(
            id: "${now.day}${now.month}${_intToMonth( now.month )}${now.hour}${now.minute}${now.second}",
            nome: "${now.month}/${now.year}",
            dataFim: "${now.day}/${_intToMonth(now.month)}",
            dataInicio: "${now.day}/${_intToMonth(now.month)}",
            finalizada: false
          );
  }

  factory Pesquisa.fromJson( Map<String, dynamic> json ) {
    return Pesquisa(
      id: json['id'] as String,
      nome: json['nome'] as String,
      dataFim: json['dataFim'] as String,
      dataInicio: json['dataInicio'] as String,
      finalizada: json['finalizada'] as bool,
    );
  }

  String getId() => id;

  String getDataInicio() => dataInicio;
  void setNome( String novadataInicio ) => dataInicio = novadataInicio;

  String getDataFim() => dataFim;
  void setMarca(String novaDataFim) => dataFim = novaDataFim;

  bool getStatus() => finalizada;
  void setStatus() => !finalizada;

  void getMounth() {
    DateTime now = DateTime.now();

    dataInicio = "${now.day}/${_intToMonth( now.month )}";
  }

  String _intToMonth( int n ) {
    switch (n) {
      case 1: return "JAN";
      case 2: return "FEV";
      case 3: return "MAR";
      case 4: return "ABR";
      case 5: return "MAI";
      case 6: return "JUN";
      case 7: return "JUL";
      case 8: return "AGO";
      case 9: return "SET";
      case 10: return "OUT";
      case 11: return "NOV";
      case 12: return "DEZ";
      default:  return "";
    }
  }
}