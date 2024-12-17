import 'package:cbc/data/models/item.dart';

class ItemRep {

  late List<Item> itens;

  Future<void> createItem( Item item ) async {
    Future.delayed( const Duration( seconds: 2 ), () {
      itens.add( item );
    });
  }

  void deleteItem( String id ) async {
    itens.removeWhere((i) => i.id == id);
  }

  List<Item> getItems() {
    return itens;
  }

  Item? getItemById( String id ) => itens.firstWhere((e) => e.id == id );
}