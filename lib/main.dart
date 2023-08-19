import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var kColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(
        255, 143, 106, 230)); //setting default colour standards

var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 99, 125));
void main() {
  
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme()
            .copyWith(color: const Color.fromARGB(255, 7, 30, 50)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kDarkColorScheme.primaryContainer)),
        useMaterial3: true,
        colorScheme: kDarkColorScheme),
    theme: ThemeData().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 200, 186, 225),
        colorScheme: kColorScheme,
        useMaterial3: true,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kColorScheme.primaryContainer)),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 18))),
    themeMode: ThemeMode.light,
    home: const Expenses(),
  ));
}
