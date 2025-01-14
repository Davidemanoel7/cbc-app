import 'package:cbc/core/theme/theme.dart';
import 'package:cbc/initializer.dart';
import 'package:cbc/presentation/routes/router.dart' as route;
import 'package:cbc/providers/auth_provider.dart';
import 'package:cbc/providers/cache_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

// Current Context Status
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
  ]);

  await initializeDateFormatting('pt_BR');

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
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: const AppInitializer(),
    );
  }
}


