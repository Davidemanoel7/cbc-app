import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Home'),
        actions: [
          IconButton(
            onPressed: ( ) => Provider.of<AuthProvider>(context, listen: false ).logout(),
            icon: const Icon( Icons.logout )
          )
        ],
      ),
      body: const Center(
        child: Text("Welcome!")
      ),
    );
  }
}