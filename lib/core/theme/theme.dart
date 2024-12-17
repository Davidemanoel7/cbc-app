import 'package:flutter/material.dart';

class AppTheme {
  // Definição das cores principais do app
  static const Color primaryColor = Color(0xFF049499);
  static const Color secondaryColor = Color(0xFFFCD03B);

  static const Color backgroundColor = Color(0xFFF9F9F9);
  static const Color surfaceColor = Colors.white;
  static const Color errorColor = Color(0xFFFF385C);
  static const Color warningColor = Color(0xFFF97611);
  static const Color successColor = Color(0xFF56C427);
  static const Color infoColor = Color(0xFF00A8FC);

  static const textTheme = TextTheme(
    titleLarge: TextStyle( fontSize: 20, fontWeight: FontWeight.w700 ),
    titleMedium: TextStyle( fontSize: 20, fontWeight: FontWeight.w400 ),
    bodyLarge: TextStyle( fontSize: 16, fontWeight: FontWeight.w700 ),
    bodyMedium: TextStyle( fontSize: 14, fontWeight: FontWeight.w400 ),
    bodySmall: TextStyle( fontSize: 13, fontWeight: FontWeight.normal ),
    labelLarge: TextStyle( fontSize: 14, fontWeight: FontWeight.bold, color:Colors.white )
  );
 

  // Definição de um esquema de cores
  static const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primaryColor,
    onPrimary: Colors.white,
    secondary: secondaryColor,
    onSecondary: Colors.black,
    background: backgroundColor,
    onBackground: Colors.black,
    surface: surfaceColor,
    onSurface: Colors.black,
    error: errorColor,
    onError: Colors.white,
  );

  // Definição do tema principal
  static final ThemeData lightTheme = ThemeData(
    colorScheme: colorScheme,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: colorScheme.onPrimary,
      elevation: 0,
    ),
    textTheme: textTheme,
    buttonTheme: const ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: colorScheme.onPrimary,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: colorScheme.copyWith(
      brightness: Brightness.dark,
      background: Colors.black,
      surface: Colors.grey[900]!,
      onBackground: Colors.white,
      onSurface: Colors.white,
    ),
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: colorScheme.onPrimary,
      elevation: 0,
    ),
    textTheme: textTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: colorScheme.onPrimary,
      ),
    ),
  );
}
