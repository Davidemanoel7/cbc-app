
import 'package:cbc/main.dart';
import 'package:flutter/material.dart';

class AppCoordinator {
  // Navegar para uma nova página
  static Future<void>? push(BuildContext context, Widget page) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  // Retornar à página anterior
  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  // Apresentar um diálogo
  static Future<void> presentDialog(Widget dialog) {
    return showDialog(
      context: navigatorKey.currentContext!,
      builder: (_) => Dialog(
        child: dialog,
      ),
    );
  }

  // Navegar para a primeira página da fila
  static Future<void>? pushAndRemoveUntil(BuildContext context, Widget page) {
    return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }

  // Exibir um Snackbar
  static void showSnackbar(SnackBarType type, String message, {bool? showCloseIcon}) {
    final context = navigatorKey.currentContext;
    Color backgroundColor;
    Color textColor;

    switch (type) {
      case SnackBarType.success:
        backgroundColor = Colors.green[700] ?? Colors.green;
        textColor = Colors.white;
      case SnackBarType.error:
        backgroundColor = Colors.red[700] ?? Colors.red;
        textColor = Colors.white;
      case SnackBarType.warning:
        backgroundColor = Colors.yellow[700] ?? Colors.yellow;
        textColor = Colors.black87;
      case SnackBarType.notice:
        backgroundColor = Colors.blue[700] ?? Colors.blue;
        textColor = Colors.black87;
    }

    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: backgroundColor,
          showCloseIcon: showCloseIcon,
          closeIconColor: textColor,
          content: Text(message,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: textColor)),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}

enum SnackBarType {
  success,
  error,
  warning,
  notice;
}