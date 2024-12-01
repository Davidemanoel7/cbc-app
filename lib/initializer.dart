import 'package:cbc/presentation/pages/home/home.dart';
import 'package:cbc/presentation/pages/login/login.dart';
import 'package:cbc/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppInitializer extends StatelessWidget {
  const AppInitializer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: ( context, authProvider, child ) {
        return authProvider.isLoggedIn ? HomeScreen() : LoginScreen();
      },

    );
  }
}