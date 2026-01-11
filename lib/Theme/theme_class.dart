import 'package:filmoteka/Theme/color.dart';
import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: colors.mainBackground,
    colorScheme: ColorScheme.dark(
      // Primary colors
      primary: colors.blue,
      onPrimary: Colors.white,
      primaryContainer: colors.blue.withOpacity(0.2),
      onPrimaryContainer: colors.blue,

      // Secondary colors
      secondary: colors.rating,
      onSecondary: Colors.white,
      secondaryContainer: colors.rating.withOpacity(0.2),
      onSecondaryContainer: colors.rating,

      // Background colors
      background: colors.mainBackground,
      onBackground: colors.mainTitle,
      surface: colors.mainBackground,
      onSurface: colors.mainTitle,
      surfaceVariant: Color(0xFF1E1E2E),

      // Error colors
      error: Color(0xFFCF6679),
      onError: Colors.white,

      // Outline
      outline: colors.greyInfo,
      outlineVariant: colors.greyInfo.withOpacity(0.3),
    ),

    // App Bar
    appBarTheme: AppBarTheme(
      color: colors.mainBackground,
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.3),
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: colors.mainTitle,
        size: 24,
      ),
      actionsIconTheme: IconThemeData(
        color: colors.mainTitle,
        size: 24,
      ),
      titleTextStyle: TextStyle(
        color: colors.mainTitle,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
      ),
      centerTitle: true,
      shape: Border(
        bottom: BorderSide(
          color: colors.greyInfo.withOpacity(0.2),
          width: 1,
        ),
      ),
    ),

    // Text Theme
    textTheme: TextTheme(
      // Display
      displayLarge: TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: colors.mainTitle,
        letterSpacing: -0.25,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: colors.mainTitle,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: colors.mainTitle,
        letterSpacing: 0,
      ),

      // Headline
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: colors.mainTitle,
        letterSpacing: 0,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: colors.mainTitle,
        letterSpacing: 0,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: colors.mainTitle,
        letterSpacing: 0,
      ),

      // Title
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: colors.mainTitle,
        letterSpacing: 0,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: colors.mainTitle,
        letterSpacing: 0.15,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: colors.mainTitle,
        letterSpacing: 0.1,
      ),

      // Body
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: colors.mainTitle,
        letterSpacing: 0.5,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: colors.mainTitle.withOpacity(0.8),
        letterSpacing: 0.25,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: colors.greyInfo,
        letterSpacing: 0.4,
      ),

      // Label
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: colors.mainTitle,
        letterSpacing: 0.1,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: colors.mainTitle,
        letterSpacing: 0.5,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: colors.greyInfo,
        letterSpacing: 0.5,
      ),
    ),

    // Input Decoration
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colors.inputColor,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: colors.blue,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Color(0xFFCF6679),
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Color(0xFFCF6679),
          width: 2,
        ),
      ),
      hintStyle: TextStyle(
        color: colors.greyInfo,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      labelStyle: TextStyle(
        color: colors.greyInfo,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      floatingLabelStyle: TextStyle(
        color: colors.blue,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      errorStyle: TextStyle(
        color: Color(0xFFCF6679),
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),

    // Button Themes
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.rating,
        foregroundColor: Colors.white,
        disabledBackgroundColor: colors.blue.withOpacity(0.3),
        disabledForegroundColor: Colors.white.withOpacity(0.5),
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
        shadowColor: colors.blue.withOpacity(0.3),
        surfaceTintColor: Colors.transparent,
        minimumSize: Size(64, 48),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colors.mainTitle,
        side: BorderSide(
          color: colors.greyInfo.withOpacity(0.3),
          width: 1,
        ),
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: Size(64, 48),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: colors.blue,
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),

    // Card Theme
    cardTheme: CardThemeData(
      color: Color(0xFF1E1E2E),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      shadowColor: Colors.black.withOpacity(0.2),
      surfaceTintColor: Colors.transparent,
      margin: EdgeInsets.zero,
    ),

    // Dialog Theme
    dialogTheme: DialogThemeData(
      backgroundColor: Color(0xFF1E1E2E),
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: colors.mainTitle,
      ),
      contentTextStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: colors.mainTitle.withOpacity(0.8),
      ),
      alignment: Alignment.center,
      actionsPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    ),

    // Bottom Navigation Bar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colors.mainBackground,
      elevation: 4,
      selectedItemColor: colors.blue,
      unselectedItemColor: colors.greyInfo,
      selectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w400,
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      enableFeedback: true,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
    ),

    // Navigation Rail
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: colors.mainBackground,
      elevation: 2,
      selectedLabelTextStyle: TextStyle(
        color: colors.blue,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelTextStyle: TextStyle(
        color: colors.greyInfo,
        fontWeight: FontWeight.w400,
      ),
      labelType: NavigationRailLabelType.all,
      groupAlignment: -0.5,
    ),

    // Chip Theme
    chipTheme: ChipThemeData(
      backgroundColor: colors.inputColor,
      disabledColor: colors.inputColor.withOpacity(0.3),
      selectedColor: colors.blue.withOpacity(0.2),
      secondarySelectedColor: colors.blue,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      labelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: colors.mainTitle,
      ),
      secondaryLabelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      brightness: Brightness.dark,
      shape: StadiumBorder(),
      side: BorderSide.none,
      elevation: 0,
    ),

    // Divider Theme
    dividerTheme: DividerThemeData(
      color: colors.greyInfo.withOpacity(0.2),
      thickness: 1,
      space: 0,
      indent: 16,
      endIndent: 16,
    ),

    // Icon Theme
    iconTheme: IconThemeData(
      color: colors.mainTitle,
      size: 24,
    ),

    // Floating Action Button
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colors.blue,
      foregroundColor: Colors.white,
      elevation: 4,
      shape: CircleBorder(),
      sizeConstraints: BoxConstraints.tightFor(width: 56, height: 56),
    ),

    // Snackbar Theme
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Color(0xFF323232),
      actionTextColor: colors.blue,
      contentTextStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 6,
      behavior: SnackBarBehavior.floating,
      insetPadding: EdgeInsets.all(16),
    ),

    // Bottom Sheet Theme
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Color(0xFF1E1E2E),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      modalBackgroundColor: Color(0xFF1E1E2E),
      modalElevation: 16,
      constraints: BoxConstraints(),
    ),

    // Tab Bar Theme
    tabBarTheme: TabBarThemeData(
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: colors.blue,
      unselectedLabelColor: colors.greyInfo,
      labelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      overlayColor: MaterialStateProperty.all(
        colors.blue.withOpacity(0.1),
      ),
    ),
  );
}
