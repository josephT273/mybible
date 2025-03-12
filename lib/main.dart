// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mybible/models/savedVerses.dart';
import 'package:mybible/models/savedFontSize.dart';
import 'package:mybible/pages/homepage.dart';
import 'package:mybible/pages/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(SavedVerseAdapter());
  Hive.registerAdapter(SavedFontSizeAdapter());
  // await Hive.openBox<SavedVerse>("SavedVerses");
  await Hive.openBox('settings');
  
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    final settingsBox = Hive.box('settings');
    setState(() {
      isDarkMode = settingsBox.get('isDarkMode', defaultValue: false);
    });
  }

  

  @override
  Widget build(BuildContext context) {
    
    void toggleTheme(bool value){
      final settingsBox = Hive.box('settings');

      settingsBox.put("isDarkMode", value);

      setState(() {
        isDarkMode = value;
      });
    }
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      routes: {
        "/": (context) => SplashScreen(),
        // "/": (context) => TestZoom(),
        "homePage": (context) => HomePage(
          isDarkMode: isDarkMode,
          toggleTheme: toggleTheme,
        ),
      },
    );
  }
}
