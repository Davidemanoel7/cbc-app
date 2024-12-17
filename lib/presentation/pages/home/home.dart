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
        appBar: const HomeAppBar( sizeHeight: 160 ),
        body: TabBarView(
          children: [
            const HomeTabScreen(),
            PesquisaTabScreen(),
            PerfilTabScreen(),
          ],
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(
            bottom: 16.0,
            left: 24.0,
            right: 24.0
          ),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular( 48.0 ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 12.0,
                spreadRadius: 1.0,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: TabBar(
            indicatorColor: Theme.of(context).colorScheme.primary,
            labelColor: Theme.of(context).colorScheme.primary,
            unselectedLabelColor: Colors.grey.shade400,
            dividerColor: Colors.transparent,
            tabs: const [
              Tab(icon: Icon(Icons.home_outlined), text: 'Home'),
              Tab(icon: Icon(Icons.shopping_basket_outlined), text: 'Pesquisas'),
              Tab(icon: Icon(Icons.person_outline_sharp), text: 'Perfil'),
            ],
          ),
        ),
      ),
    );
  }
}