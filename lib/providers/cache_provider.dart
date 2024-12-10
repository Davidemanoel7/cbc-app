import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheProvider extends ChangeNotifier {

  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  Future<void> initCache() async {
    await _pref.then(
      (pref) {
        // _isLoged = pref.getBool('isLoged');
        // Pegar outros dados...
      }
    );
    notifyListeners();
  }

  Future<void> setItemFromCache( String key, TypeKey typeKey, dynamic value ) async {
    switch( typeKey ) {
      case TypeKey.string:
        await _pref.then(( p ) => p.setString( key, value ));
        return;
      case TypeKey.int:
        await _pref.then((p) => p.setInt( key, value ));
        return;
      case TypeKey.bool:
        await _pref.then((p) => p.setBool( key, value ));
        return;
      case TypeKey.double:
        await _pref.then((p) => p.setDouble( key, value ));
        return;
      default:
        return;
    }
  }

  Future<void> getItemFromCache( String key, TypeKey typeKey ) async {
    switch( typeKey ) {
      case TypeKey.string:
        await _pref.then(( p ) => p.getString( key ));
        return;
      case TypeKey.int:
        await _pref.then((p) => p.getInt( key ));
        return;
      case TypeKey.bool:
        await _pref.then((p) => p.getBool( key ));
        return;
      case TypeKey.double:
        await _pref.then((p) => p.getDouble( key ));
        return;
      default:
        return;
    }
  }

  Future<void> clearCache() async {
    await _pref.then(( p ) => p.clear());
  }

  Future<void> removeItemFromCache( String key ) async {
    await _pref.then((p) => p.remove(key));
  }
}

enum TypeKey {
  bool,
  string,
  int,
  dynamic,
  double
  // ... OR MORE...
}