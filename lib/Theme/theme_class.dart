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
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        fillColor: colors.inputColor,
        focusColor: colors.inputColor,
        hoverColor: colors.inputColor,
        outlineBorder: BorderSide(color: Colors.white, width: 20),
        border: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        disabledBorder: InputBorder.none),
    colorScheme: const ColorScheme.dark(
      background: colors.mainBackground,
      primary: colors.purple2,
      onPrimary: colors.purple2,
      secondary: colors.blue,
      onSecondary: Color.fromARGB(255, 255, 0, 98),
    ),
  );
}
