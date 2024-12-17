import 'package:cbc/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PerfilTabScreen extends StatelessWidget {
  PerfilTabScreen({super.key});

  List<String> nomes = [
    "David",
    "Bre",
    "sdfkjs",
    "sdkfjh"
  ];

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all( Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      offset: const Offset( 0, 5 ),
                      blurRadius: 16.0
                    )
                  ]
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        "Editar perfil",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      onTap: () {
                        debugPrint("# Editar perfil");
                      },
                      trailing: Icon(
                        Icons.edit,
                        color: Theme.of(context).colorScheme.primary
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Sobre a Pesquisa",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      onTap: () {
                        debugPrint("# Sobre a Pesquisa");
                      },
                      trailing: Icon(
                        Icons.shopping_basket_outlined,
                        color: Theme.of(context).colorScheme.primary
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Sobre o E-Cesta Básica",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      onTap: () {
                        debugPrint("# Sobre o E-Cesta Básica");
                      },
                      trailing: Icon(
                        Icons.smartphone_outlined,
                        color: Theme.of(context).colorScheme.primary
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Sobre o PET CoUrSe",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      onTap: () {
                        debugPrint("# Sobre o PET CoUrSel");
                      },
                      trailing: Icon(
                        Icons.announcement_outlined,
                        color: Theme.of(context).colorScheme.primary
                      ),
                    ),
                  ],
                  
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ListTile(
                    onTap: () {
                      authProvider.logout();
                    },
                    title: Text(
                      "Sair do Aplicativo",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error
                      ),
                    ),
                    trailing: Icon(
                      Icons.logout,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}