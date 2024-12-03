import 'package:cbc/initializer.dart';
import 'package:cbc/providers/auth_provider.dart';
import 'package:cbc/providers/cache_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
  ]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CacheProvider()..initCache()),
        ChangeNotifierProvider(create: (_) => AuthProvider()..initializerAuth())
      ],
      child: const CbcApp(),
    ),
  );
} 

class CbcApp extends StatelessWidget {
  const CbcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppInitializer(),
    );
  }
}


