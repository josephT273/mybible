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
  // Dark theme suitable for Bible reading:
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF3B3F45),   // Soft dark header color
      onPrimary: Color(0xFFECECEC), // Light text on primary for clarity
      surface: Color(0xFF1E1E1E),   // Dark background for reading comfort
      onSurface: Color(0xFFB0BEC5), // Secondary text color
      secondary: Color(0xFF8C9EFF), // Accent blue remains for highlights
      onSecondary: Color(0xFFECECEC),
    ),
    scaffoldBackgroundColor: const Color(0xFF1E1E1E),
    useMaterial3: true,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Color(0xFFECECEC)), // Body text color
    ),
  );

  // Light theme suitable for Bible reading:
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF607D8B),   // Header color: rich blue/grey
      onPrimary: Color(0xFF1B1B1B), // Dark text on primary headers
      surface: Color(0xFFFDFDFD),   // Off-white reading background
      onSurface: Color(0xFF424242), // Secondary text color for contrast
      secondary: Color(0xFF8FA8D9), // Soft accent blue for highlights
      onSecondary: Color(0xFF1B1B1B),
    ),
    scaffoldBackgroundColor: const Color(0xFFFDFDFD),
    useMaterial3: true,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Color(0xFF1B1B1B)), // Body text color
    ),
  );
}