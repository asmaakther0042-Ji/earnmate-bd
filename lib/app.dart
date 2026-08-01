import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

class EarnMateApp extends StatelessWidget {
  const EarnMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EarnMate BD',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),

      home: const SplashScreen(),
    );
  }
}
