import 'package:cbc/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  final _globalTextKey = GlobalKey<FormState>(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 48,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        './lib/assets/images/icone.png',
                        fit: BoxFit.cover,
                        height: 86,
                      ),
                      const Text(
                        "E-Cesta Básica",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Entre na sua conta",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A)
                    ),
                  ),
                  Form(
                    key: _globalTextKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextFormField(
                          controller: emailController,
                          cursorColor: Colors.blueAccent,
                          decoration: InputDecoration(
                            labelText: "E-mail",
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all( Radius.circular(8))
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue.shade300,
                              )
                            ),
                          ),
                          autocorrect: true,
                          keyboardType: TextInputType.emailAddress,
                          validator: ( String? value ) => value!.isEmpty ? "E-mail não pode ser nulo" : null
                        ),
                        const SizedBox( height: 24 ),
                        TextFormField(
                          controller: senhaController,
                          cursorColor: Colors.blueAccent,
                          decoration: InputDecoration(
                            labelText: "Senha",
                            suffixIcon: IconButton(
                              onPressed: () { },
                              icon: Icon(
                                Icons.remove_red_eye_sharp,
                                size: 24,
                                color: Colors.grey.shade400,
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all( Radius.circular(8)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue.shade300,
                              )
                            ),
                            counter: GestureDetector(
                              onTap: (){},
                              child: Text(
                                "esqueceu senha?",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blue.shade300,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            )
                          ),
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          validator: ( String? value ) {
                            if ( value != null && value.isEmpty ) {
                              return "Digite uma senha válida";
                            } else if ( value!.length < 6 ) {
                              return "Senha muito curta";
                            } else {
                              return null;
                            }
                          } 
                        )
                      ],
                    )
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if ( _globalTextKey.currentState!.validate() ) {
                        debugPrint('email: ${emailController.text}');
                        debugPrint('senha: ${senhaController.text}');
                        Provider.of<AuthProvider>(context, listen: false).login();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent.shade200,
                      alignment: Alignment.center,
                      fixedSize: Size(
                        MediaQuery.of(context).size.width,
                        56.0
                      )
                    ),
                    child: const Text(
                      "Entrar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold 
                      ),
                    )
                  ),
                  Divider(
                    color: Colors.grey.shade200,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 4,
                    children: [
                      const Text("Não tem uma conta?"),
                      GestureDetector(
                        onTap: () {
                          // mandar pra criar conta...
                          debugPrint("Mandar pra tela de criar conta");
                        },
                        child: const Text(
                          "Cadastre-se",
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
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