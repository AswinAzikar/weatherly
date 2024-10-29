import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTheme {
  static Color lightThemeColor = Colors.red,
      white = Colors.white,
      black = Colors.black,
      darkThemeColor = Colors.yellow;

  static final lightTheme = ThemeData(
    primaryColor: lightThemeColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: white,
    useMaterial3: true,
    switchTheme: SwitchThemeData(
      thumbColor:
          WidgetStateProperty.resolveWith<Color>((states) => lightThemeColor),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: white,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color: black,
        fontSize: 23,
      ),
      iconTheme: IconThemeData(color: lightThemeColor),
      elevation: 0,
      actionsIconTheme: IconThemeData(color: lightThemeColor),
      systemOverlayStyle: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // Set to dark for light theme
      ),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: darkThemeColor,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: black,
    useMaterial3: true,
    switchTheme: SwitchThemeData(
      trackColor:
          WidgetStateProperty.resolveWith<Color>((states) => darkThemeColor),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: black,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color: white,
        fontSize: 23,
      ),
      iconTheme: IconThemeData(color: darkThemeColor),
      elevation: 0,
      actionsIconTheme: IconThemeData(color: darkThemeColor),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: black,
        statusBarIconBrightness:
            Brightness.light, // Set to light for dark theme
      ),
    ),
  );
}
