import 'package:flutter/material.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});


  void _showBottomSheetModal( BuildContext context ){
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true, // Permite usar mais espaço da tela
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Faz a BottomSheet ocupar apenas o espaço necessário
            children: [
              Text(
                "Título da BottomSheet",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text("Este é o conteúdo da BottomSheet."),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Fechar"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16.0,
              children: [
                Text(
                  "Pesquisa em andamento",
                  style: Theme.of(context).textTheme.bodyLarge
                ),
                Container(
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: const BorderRadius.all( Radius.circular(16))
                  ),
                ),
                Text(
                  "Pesquisas finalizadas",
                  style: Theme.of(context).textTheme.bodyLarge
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey.shade100,
                      indent: 8,
                      endIndent: 8,
                    ),
                    itemCount: 10,
                    itemBuilder: ( context, index ) =>
                      Container(
                        height: 42,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: const BorderRadius.all( Radius.circular(16))
                        ),
                        child: Text( (1 + index).toString() ),
                      ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.7,
                        48
                      )
                    ),
                    onPressed: () {
                      // _showBottomSheetModal(context);
                    },
                    child: Text(
                      "Cadastrar pesquisa",
                      style: Theme.of(context).textTheme.labelLarge
                    )
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}