import 'package:cbc/core/constants/global_widgets.dart';
import 'package:cbc/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class ProviderBase extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  showLoading() {
    _isLoading = true;
    notifyListeners();
  }

  hideLoading() {
    _isLoading = false;
    notifyListeners();
  }

  onFailure(String message) {
    showToast(navigatorKey.currentContext!,
        "$message, tente novamente ou veja sua conexão com a intenet.", backgroundColor: Colors.red);
  }
}

class ProviderWidget<P extends ProviderBase> extends StatelessWidget {
  final P Function() instance;
  final Widget Function(BuildContext context, P presenter) builder;

  const ProviderWidget(
      {super.key, required this.instance, required this.builder});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<P>(
      create: (_) => instance(),
      child: Consumer<P>(
        builder: (context, presenter, child) {
          return builder(context, presenter);
        },
      ),
    );
  }
}
