import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier {
  ThemeData theme = Themes.dark;
  
  void changeTheme(ThemeData theme) {
    this.theme = theme;
    notifyListeners();
  }
}

class Themes {
  static final ThemeData red = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      background: Colors.red[100]!,
      secondary: Colors.red[200]!,
      onSecondary: Colors.white,
      onBackground: Colors.white,
      primary: Colors.red[300]!,
      onPrimary: Colors.white,
      primaryContainer: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      outline: Colors.grey,
      surface: Colors.red[300]!,
      onSurface: Colors.white24,
      onTertiary: Colors.white38,
      shadow: Colors.black
    ),
    useMaterial3: true
  );
  static final ThemeData orange = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      background: Colors.deepOrange[100]!,
      secondary: Colors.deepOrange[200]!,
      onSecondary: Colors.white,
      onBackground: Colors.white,
      primary: Colors.deepOrange[300]!,
      onPrimary: Colors.white,
      primaryContainer: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      outline: Colors.grey,
      surface: Colors.deepOrange[300]!,
      onSurface: Colors.white24,
      onTertiary: Colors.white38,
      shadow: Colors.black
    ),
    useMaterial3: true
  );
  static final ThemeData yellow = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      background: Colors.yellow[100]!,
      secondary: Colors.yellow[200]!,
      onSecondary: Colors.grey[400]!,
      onBackground: Colors.grey[200]!,
      primary: Colors.yellow[300]!,
      onPrimary: Colors.grey[400]!,
      primaryContainer: Colors.grey[400]!,
      error: Colors.red,
      onError: Colors.grey[400]!,
      outline: Colors.grey,
      surface: Colors.yellow[300]!,
      onSurface: Colors.white24,
      onTertiary: Colors.white38,
      shadow: Colors.black
    ),
    useMaterial3: true
  );
  static final ThemeData green = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      background: Colors.green[100]!,
      secondary: Colors.green[200]!,
      onSecondary: Colors.white,
      onBackground: Colors.white,
      primary: Colors.green[300]!,
      onPrimary: Colors.white,
      primaryContainer: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      outline: Colors.grey,
      surface: Colors.green[300]!,
      onSurface: Colors.white24,
      onTertiary: Colors.white38,
      shadow: Colors.black
    ),
    useMaterial3: true
  );
  static final ThemeData blue = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      background: Colors.blue[100]!,
      secondary: Colors.blue[200]!,
      onSecondary: Colors.white,
      onBackground: Colors.white,
      primary: Colors.blue[300]!,
      onPrimary: Colors.white,
      primaryContainer: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      outline: Colors.grey,
      surface: Colors.blue[300]!,
      onSurface: Colors.white24,
      onTertiary: Colors.white38,
      shadow: Colors.black
    ),
    useMaterial3: true
  );
  static final ThemeData purple = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      background: Colors.deepPurple[100]!,
      secondary: Colors.deepPurple[200]!,
      onSecondary: Colors.white,
      onBackground: Colors.white,
      primary: Colors.deepPurple[300]!,
      onPrimary: Colors.white,
      primaryContainer: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      outline: Colors.grey,
      surface: Colors.deepPurple[300]!,
      onSurface: Colors.white24,
      onTertiary: Colors.white38,
      shadow: Colors.black
    ),
    useMaterial3: true
  );
  static final ThemeData light = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      background: Colors.deepPurple[100]!,
      secondary: Colors.deepPurple[200]!,
      onSecondary: Colors.white,
      onBackground: Colors.white,
      primary: Colors.deepPurple[300]!,
      onPrimary: Colors.white,
      primaryContainer: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      outline: Colors.grey,
      surface: Colors.deepPurple[300]!,
      onSurface: Colors.white24,
      onTertiary: Colors.white38,
      shadow: Colors.black
    ),
    useMaterial3: true
  );
  static final ThemeData dark = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      background: Colors.grey[600]!,
      secondary: Colors.grey[700]!,
      onSecondary: Colors.white,
      onBackground: Colors.grey[500]!,
      primary: Colors.grey[800]!,
      onPrimary: Colors.white,
      primaryContainer: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      outline: Colors.grey[700],
      surface: Colors.grey[900]!,
      onSurface: Colors.white24,
      onTertiary: Colors.white38,
      shadow: Colors.black
    ),
    useMaterial3: true
  );

  static final List list = [
    [red, "Red"],
    [orange, "Orange"],
    [yellow, "Yellow"],
    [green, "Green"],
    [blue, "Blue"],
    [purple, "Purple"],
    [dark, "Dark"]
  ];
}