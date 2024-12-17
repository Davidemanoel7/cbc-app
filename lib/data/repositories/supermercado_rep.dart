import 'package:cbc/data/models/supermercado.dart';

class SupermercadoRep {
  late List<Supermercado> sups;

  Future<void> createSup( Supermercado sup ) async {
    Future.delayed( const Duration( seconds: 2), () {
      sups.add(sup);
    });
  }

  Future<void> deleteSup( String id ) async {
    Future.delayed( const Duration(seconds: 1),
      () => sups.removeWhere( (s) => s.id == id )
    );
  }

  Future<List<Supermercado>> getSups() async {
    // API Call
    return Future.delayed( const Duration( seconds: 2), () => sups );
  }

  Future<Supermercado>? getSup( String id ) async => sups.firstWhere((s) => s.getID() == id) ;
}