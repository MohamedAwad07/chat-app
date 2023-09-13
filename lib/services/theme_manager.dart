import 'package:flutter/material.dart';
import '../shared/constants/color_manager.dart';

class ThemeManager {
  ThemeManager._();

  static getAppLightTheme() => ThemeData.light(useMaterial3: true).copyWith(
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey[400];
                }
                return Colors.red;
              }))),
      textTheme: TextTheme(
        titleMedium: TextStyle(
            fontSize: 18,
            color: Colors.pinkAccent,
            fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(
            fontSize: 18,
            color: Colors.pinkAccent,
            fontWeight: FontWeight.bold),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.indigo,
        titleSpacing: 10,
      ),
      checkboxTheme: CheckboxThemeData());

  static getAppDarkTheme() => ThemeData.dark(useMaterial3: true).copyWith(
      appBarTheme: AppBarTheme(
          toolbarHeight: 75,
          titleSpacing: 10,
          backgroundColor: ColorsManager.successMessage),
      scaffoldBackgroundColor: ColorsManager.successMessage,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(200, 50),
          maximumSize: const Size(300, 60),
        ),
      ),
      dividerTheme: const DividerThemeData(color: Colors.red, thickness: 5),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: Colors.white,
          fontSize: 50,
          // fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          height: 1.38,
        ),
        titleMedium: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(Colors.amber)));
}
