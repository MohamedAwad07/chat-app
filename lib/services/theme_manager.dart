import 'package:flutter/material.dart';
import '../shared/constants/color_manager.dart';

class ThemeManager {
  ThemeManager._();

  static getAppLightTheme() => ThemeData.light(useMaterial3: true).copyWith(
      inputDecorationTheme:  InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius:  BorderRadius.circular(15.0),
          borderSide: BorderSide(color: ColorsManager.brown, width: 2),
        ),
      ),
      textTheme: TextTheme(
        headlineMedium: TextStyle(
          fontFamily: 'LilitaOne',
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: ColorsManager.brown,
        ),
        titleMedium: TextStyle(
          fontSize: 15.0,
          color: ColorsManager.brown,
          fontWeight: FontWeight.w500,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.indigo,
      ),
      checkboxTheme: CheckboxThemeData());

  static getAppDarkTheme() => ThemeData.dark(useMaterial3: true).copyWith(
      scaffoldBackgroundColor: Color(0xFF000C1E),
      appBarTheme:
          AppBarTheme(elevation: 5.0, backgroundColor: Color(0xFF01132F)),
      inputDecorationTheme:  InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius:  BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
      ),
      textTheme: TextTheme(
        headlineMedium: TextStyle(
          fontFamily: 'LilitaOne',
          fontSize: 30.0,
          color: ColorsManager.white,
        ),
        titleMedium: TextStyle(
          fontSize: 15.0,
          color: ColorsManager.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      checkboxTheme:
          CheckboxThemeData(fillColor: MaterialStateProperty.all(Colors.grey)));
}
