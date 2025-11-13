import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MobileUTSApp());
}

class MobileUTSApp extends StatelessWidget {
  const MobileUTSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS Pemrograman Mobile ITENAS',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      // Definisikan halaman awal
      home: const SplashScreen(),
    );
  }
}