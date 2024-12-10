import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  Map<String, dynamic>? _userInfoKey;
  String? _accessToken;
  String? _refreshToken;
  bool? _isLoggedIn;

  // Getters
  Map<String, dynamic>? get userInfo => _userInfoKey;
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;
  bool? get isLoggedIn => _isLoggedIn;

  // Simular Login
  Future<void> login() async {
    await Future.delayed(const Duration(seconds: 2), () {
      _isLoggedIn = true;
      debugPrint("Login. isLoggedIn = $_isLoggedIn");
      notifyListeners();
    });
  }

  // Simular Logout
  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 2)); // Simula request
    _isLoggedIn = false;
    debugPrint("Logout. isLoggedIn = $_isLoggedIn");
    notifyListeners();
  }

  // Inicializador de Autenticação
  Future<void> initializerAuth() async {
    debugPrint("initializerAuth iniciado...");
    await Future.delayed(const Duration(seconds: 2)); // Simula inicialização

    // Simulação de lógica de validação de token
    bool tokenIsValid = false; // Atualize conforme a lógica
    _isLoggedIn = tokenIsValid;
    debugPrint("initializerAuth completo. isLoggedIn = $_isLoggedIn");
    notifyListeners();
  }
}
