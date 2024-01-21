import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class AppTheme {

  static const colorLightScheme = ColorScheme(
    background: Color(0xFFEDF5FD),
    onBackground: Colors.black26,
    brightness: Brightness.light,
    error: Colors.red,
    onError: Colors.redAccent,
    primary: Color(0xFF53989a),
    onPrimary: Colors.greenAccent,
    secondary: Color(0xFF05426E),
    onSecondary: Colors.blueAccent,
    surface: Color(0xF3F1F1FF),
    onSurface: Colors.blueGrey,
    surfaceTint: Colors.white
  );

  static const colorDarkScheme = ColorScheme(
    background: Colors.black,
    onBackground: Colors.black26,
    brightness: Brightness.light,
    error: Colors.red,
    onError: Colors.redAccent,
    primary: Colors.green,
    onPrimary: Colors.greenAccent,
    secondary: Colors.blue,
    onSecondary: Colors.blueAccent,
    surface: Colors.grey,
    onSurface: Colors.blueGrey,
  );

  final bool isDarkMode;

  AppTheme(this.isDarkMode);

  ThemeData getTheme() {

    late final ColorScheme colorScheme;

    if(isDarkMode) {
      colorScheme = colorDarkScheme;
    } else {
      colorScheme = colorLightScheme;
    }

    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Inter',
      colorScheme: colorScheme,
      textTheme: const TextTheme().copyWith(
        displaySmall: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
        ),
        bodySmall: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        titleSmall: const TextStyle(
        ),
        titleMedium: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        titleLarge: const TextStyle(
            fontWeight: FontWeight.bold
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        // hoverColor: _greenLightApp,
        // focusColor: _blueApp,
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            // iconColor: _blueApp,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
            ),
          )
      ),
      textSelectionTheme: const TextSelectionThemeData(
          // cursorColor: _blueApp,
          // selectionHandleColor: _blueApp
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        // color: _greenLightApp,
        circularTrackColor: Colors.grey,
      ),
      appBarTheme: const AppBarTheme(
        // backgroundColor: _greenLightApp,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark
        ),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          // color: _blueApp,
          borderRadius: BorderRadius.circular(5)
        ),
        triggerMode: TooltipTriggerMode.tap
      )
    );
  }

  AppTheme copyWith({
    final bool? isDarkMode
  }) => AppTheme(isDarkMode ?? this.isDarkMode);
}