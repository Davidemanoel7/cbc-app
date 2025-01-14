import 'package:cbc/data/models/market.dart';
import 'package:cbc/data/models/research.dart';
import 'package:cbc/initializer.dart';
import 'package:cbc/presentation/pages/forgotpass/forgot_password_view.dart';
import 'package:cbc/presentation/pages/login/login.dart';
import 'package:cbc/presentation/pages/markets/markets_view.dart';
import 'package:cbc/presentation/pages/research_detail/research_detail_view.dart';
import 'package:cbc/presentation/pages/research_form/research_form_view.dart';
import 'package:cbc/presentation/pages/tabs/tab_screen.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.init:
        return MaterialPageRoute(builder: (_) => const AppInitializer());
      case RoutePaths.login:
       return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutePaths.forgot:
        return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      case RoutePaths.tabs:
        return MaterialPageRoute(builder: (_) => const TabScreen());
      case RoutePaths.researchForm:
        final arguments = settings.arguments as Map;
        final Research research = arguments['research'] as Research;
        final Market market = arguments['market'] as Market;
        return MaterialPageRoute(
            builder: (_) => ResearchFormView(
                  selectedMarket: market,
                  research: research,
                ));
      case RoutePaths.researchDetail:
        final Research research = settings.arguments as Research;
        return MaterialPageRoute(builder: (_) => ResearchDetailView(research: research,));
      case RoutePaths.markets:
        final Research research = settings.arguments as Research;
        return MaterialPageRoute(
            builder: (_) => MarketsView(
                  research: research,
                ));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

class RoutePaths {
  static const String init = '/';
  static const String login = '/login';
  static const String forgot = '/forgot';
  static const String tabs = '/home';
  static const String researchForm = '/researchForm';
  static const String researchDetail = '/researchDetail';
  static const String markets = '/markets';
}
