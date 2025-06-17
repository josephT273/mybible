import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeProvider extends ChangeNotifier {
  late bool isDarkMode = true;
  late Box settings;

  ThemeProvider() {
    initialize();
  }

  Future<void> initialize() async {
    settings = await Hive.openBox('settings');
    isDarkMode = settings.get('isDarkMode', defaultValue: true);
    notifyListeners();
  }

  ThemeMode get themeMode => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme(bool isOn) {
    isDarkMode = isOn;
    settings.put('isDarkMode', isOn);
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF2C2C2C),
      onPrimary: Colors.white,
      surface: Color(0xFF121212),
      onSurface: Color(0xFFCCCCCC),
      secondary: Color(0xFF3A3A3A),
      onSecondary: Colors.white,
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    useMaterial3: true,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
    ),
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFE0E0E0),
      onPrimary: Colors.black,
      surface: Colors.white,
      onSurface: Color(0xFF333333),
      secondary: Color(0xFFB0B0B0),
      onSecondary: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black),
    ),
  );
}
