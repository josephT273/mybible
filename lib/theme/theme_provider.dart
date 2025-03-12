import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = Hive.box('settings').get('isDarkMode', defaultValue: true);

  ThemeMode get themeMode => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme(bool isOn) {
    isDarkMode = isOn;
    Hive.box('settings').put('isDarkMode', isOn);
    notifyListeners();
  }
}

class MyThemes {
  // Dark Theme: Optimized for low-light reading (Soft dark tones with warm accents)
  static final darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF2E3B4E), // Deep navy for icons and headers
      onPrimary: Color(0xFFFAFAFA), // Light text for high contrast
      surface:
          Color.fromARGB(255, 0, 0, 0), // Soft black for background (reduces eye strain)
      secondary:
          Color(0xFF607D8B), // Muted teal for accents (e.g., verse highlight)
      onSurface: Color(0xFFB0BEC5), // Subtle grey for secondary text
    ),
    scaffoldBackgroundColor: Color(0xFF121212), // Consistent background
    useMaterial3: true,
  );

  // Light Theme: Clean and bright (Warm whites and soft blues)
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Color.fromARGB(169, 120, 121, 122), // Rich blue for icons and headers
      onPrimary: Color(0xFF1B1B1B), // Dark grey for text (better readability)
      surface: Color.fromARGB(255, 187, 187, 187), // Soft white for background
      secondary:
          Color(0xFF8FA8D9), // Pastel blue for accents (e.g., verse highlight)
      onSurface: Color.fromARGB(255, 172, 172, 172), // Cool grey for secondary text
    ),
    scaffoldBackgroundColor: Color(0xFFF5F5F5), // Light neutral for background
    useMaterial3: true,
  );
}
