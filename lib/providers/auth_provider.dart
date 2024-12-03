import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;
  
  Future<void> login() async {
    // TODO: Login...
    await Future.delayed( const Duration( seconds: 2 ) ); // simulando recebimento de um token de acesso (acessToken e refreshToken)...

    // TODO: Salvar token em cache

    _isLoggedIn = true;
    debugPrint("Login. isLoggedIn = $_isLoggedIn" );
    notifyListeners();
  }

  Future<void> logout() async {
    // TODO: Logout..
    await Future.delayed( const Duration( seconds: 2 ) ); // simulando request para deletar token de acesso...

    // TODO: Deletar token da cache.
    _isLoggedIn = false;
    debugPrint("Logout. isLoggedIn = $_isLoggedIn" );
    notifyListeners();
  }

  Future<void> initializerAuth() async {
    await Future.delayed( const Duration( seconds: 2 ) ); // simulando
    // Verificar se o token é válido...
  
    // if ( cache.getToken != null ) {
      //  _isLoggedIn = validateToken( token ) ? true : false; 
    // } else {
    //    _isLoggedIn = false
    //}
    debugPrint("Iniciando Auth");
    await login();
    notifyListeners();
  }

}