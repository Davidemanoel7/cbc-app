import 'package:flutter/material.dart';

class PesquisaTabScreen extends StatelessWidget {
  PesquisaTabScreen({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all( 24 ),
          child: SingleChildScrollView(
            child: Column(
              spacing: 24.0,
              children: [
                TextFormField(
                  controller: searchController,
                  cursorColor: ColorScheme.of(context).secondary,
                  decoration: InputDecoration(
                    hintText: "Pesquisar",
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all( Radius.circular(8))
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorScheme.of(context).primary,
                      )
                    ),
                  ),
                  autocorrect: true,
                  keyboardType: TextInputType.emailAddress,
                  validator: ( String? value ) => value!.isEmpty ? "E-mail não pode ser nulo" : null
                ),
                Column(
                  spacing: 24.0,
                  children: [
                    const Text("Nenhuma pesquisa cadastrada..."),
                    Image.asset(
                      "./lib/assets/images/market_car.png",
                      color: Theme.of(context).colorScheme.primary,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}