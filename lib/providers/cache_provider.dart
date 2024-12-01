import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheProvider extends ChangeNotifier {
  Map<String, dynamic>? _userInfoKey;

  String? _acessToken;
  String? _refreshToken;

  Map<String, dynamic>? get userInfor => _userInfoKey;

  String? get acessToken => _acessToken;

  String? get refreshToken => _refreshToken;

  Future<void> initCache () async {
    SharedPreferences.getInstance().then(
      (pref) {
        _acessToken = pref.getString('acess_token');
        // Pegar outros dados...
      }
    );
    // notifyListeners();
  }

  
}