import 'package:cbc/core/widgets/home_appbar.dart';
import 'package:cbc/presentation/pages/home/home_tab_screen.dart';
import 'package:cbc/presentation/pages/pefil/perfil_tab_screen.dart';
import 'package:cbc/presentation/pages/pesquisa/pesquisa_tab_screen.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const HomeAppBar( sizeHeight: 120 ),
        body: const TabBarView(
          children: [
            HomeTabScreen(),
            PesquisaTabScreen(),
            PerfilTabScreen(),
          ],
        ),
        bottomNavigationBar: TabBar(
          indicatorColor: Theme.of(context).colorScheme.primary,
          labelColor: Theme.of(context).colorScheme.primary,
          unselectedLabelColor: Colors.grey.shade400,
          tabs: const [
            Tab(icon: Icon(Icons.home), text: 'Home'),
            Tab(icon: Icon(Icons.shopping_basket_outlined), text: 'Pesquisar'),
            Tab(icon: Icon(Icons.person), text: 'Perfil'),
          ],
        ),
      ),
    );
  }
}