// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mybible/models/savedVerses.dart';
import 'package:mybible/models/savedFontSize.dart';
import 'package:mybible/pages/homepage.dart';
import 'package:mybible/pages/splashscreen.dart';
import 'package:mybible/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(SavedVerseAdapter());
  Hive.registerAdapter(SavedFontSizeAdapter());
  // await Hive.openBox<SavedVerse>("SavedVerses");
  await Hive.openBox('settings');

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      themeMode: themeProvider.themeMode,
      routes: {
        "/": (context) => SplashScreen(),
        // "/": (context) => TestZoom(),
        "homePage": (context) => HomePage(),
      },
    );
  }
}
