import 'package:cbc/data/models/supermercado.dart';
import 'package:cbc/data/repositories/item_rep.dart';
import 'package:cbc/data/repositories/supermercado_rep.dart';
import 'package:flutter/material.dart';

class PesquisaProvider extends ChangeNotifier{
  final SupermercadoRep _supRepository;
  final ItemRep _itemRep;

  PesquisaProvider({
    required SupermercadoRep,
    required ItemRep
  }) : _itemRep = ItemRep, _supRepository = SupermercadoRep;

  
  SupermercadoRep get getSupRep => _supRepository;
  ItemRep get getItemTep => _itemRep;

  Future<Supermercado?> getSup( String id ) async {
    try {
      Supermercado? s = await _supRepository.getSup( id );
      return s;
    } catch (e) {
        debugPrint("$e");
    } finally {
      notifyListeners();
    }
  }

}