import 'package:flutter/material.dart';

String capitalizeFirstLetter(String str) {
  if (str.isEmpty) return str; // Verifica se a string está vazia
  return str[0].toUpperCase() + str.substring(1).toLowerCase();
}

void showToast(BuildContext context, String message, {Color? backgroundColor}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: backgroundColor,
    content: Text(message),
    showCloseIcon: true,
  ));
}

BoxDecoration radiusDecoration(
    {DecorationImage? decorationImage,
    Color? color = Colors.white,
    Color borderColor = Colors.transparent,
    BoxBorder? border,
    double radius = 8.0}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    border: border ?? Border.all(width: 1, color: borderColor),
    shape: BoxShape.rectangle,
    color: color,
    image: decorationImage,
  );
}


InputDecoration inputDecoration(
    BuildContext context, String labelText, 
    {IconData? iconData,String? prefix,
    String? helperText,
    IconData? rightIcon,
    VoidCallback? rightIconAction}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    helperText: helperText,
    labelText: labelText,
    labelStyle: const TextStyle(color: Colors.grey),
    fillColor: Colors.grey.shade200,
    // filled: true,
    prefixText: prefix,
    prefixIcon: iconData == null ? null : Icon(
      iconData,
      size: 20,
      color: Theme.of(context).colorScheme.onSurface,
    ),
    suffixIcon: rightIcon != null
        ? IconButton(
            icon: Icon(
              rightIcon,
              size: 20,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: rightIconAction,
          )
        : null,
    prefixIconConstraints: const BoxConstraints(minWidth: 60),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.onSurface)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.error)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.surface)),
  );
}
