import 'package:flutter/material.dart';
import 'dashboard_screen.dart'; // Import Dashboard

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Data Wajib: Ganti dengan data Bang Rafi
  final String judulAplikasi = 'Pemrograman Mobile';
  final String nama = 'M. Rafi Tajudin';
  final String nim = '152023207';
  final String fotoPath = 'assets/profile.jpg'; // Pastikan ada di pubspec.yaml & folder assets

  @override
  void initState() {
    super.initState();
    // Navigasi ke Dashboard setelah 5 detik
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) { 
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const DashboardScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image Foto Anda
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(fotoPath),
              backgroundColor: Colors.grey.shade300,
            ),
            const SizedBox(height: 20),
            Text(
              judulAplikasi,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'NIM: $nim',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Nama: $nama',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 40),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo),
            ),
          ],
        ),
      ),
    );
  }
}