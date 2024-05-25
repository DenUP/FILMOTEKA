import 'package:filmoteka/Theme/color.dart';
import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData darkTheme = ThemeData(
    textTheme: const TextTheme(
      labelSmall: TextStyle(
        fontSize: 12,
        color: colors.mainTitle,
        // fontFamily: 'Popins',
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        color: Colors.white,
      ),
    ),
    scaffoldBackgroundColor: colors.mainBackground,
    // shadowColor: Colors.green,
    appBarTheme: const AppBarTheme(
      color: colors.mainBackground,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        fillColor: Colors.red,
        focusColor: Colors.red,
        hoverColor: Colors.red,
        outlineBorder: BorderSide(color: Colors.white, width: 20),
        border: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        disabledBorder: InputBorder.none),
    colorScheme: const ColorScheme.dark(
        background: colors.purple2,
        primary: colors.purple2,
        onPrimary: colors.purple2,
        secondary: Colors.red,
        onSecondary: colors.tertiary),
  );
}
