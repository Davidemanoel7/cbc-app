import 'package:flutter/material.dart';

class EsqueceuSenha extends StatelessWidget {
  EsqueceuSenha({super.key}); 

  final senhaController = TextEditingController();
  final _globalTextKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recuperação de senha",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        forceMaterialTransparency: true,
        foregroundColor: Theme.of(context).colorScheme.primary,
        elevation: 2,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 48,
                children: [
                  Image.asset(
                    './lib/assets/images/icone.png',
                    fit: BoxFit.cover,
                    height: 86,
                  ),
                  Text(
                    "Para concluir sua solicitação, insira o seu e-mail  para enviarmos o código de verificação",
                    style: Theme.of(context).textTheme.bodyMedium
                  ),
                  Form(
                    key: _globalTextKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFormField(
                      controller: senhaController,
                      cursorColor: ColorScheme.of(context).secondary,
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all( Radius.circular(8)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorScheme.of(context).primary,
                          )
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: ( String? value ) {
                        if ( value != null && value.isEmpty ) {
                          return "Digite um email válido";
                        } else {
                          return null;
                        }
                      } 
                    )
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //Provider.of<AuthProvider>(context, listen: false).login();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorScheme.of(context).primary,
                      alignment: Alignment.center,
                      fixedSize: Size(
                        MediaQuery.of(context).size.width,
                        56.0
                      )
                    ),
                    child: const Text(
                      "Prosseguir",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold 
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}