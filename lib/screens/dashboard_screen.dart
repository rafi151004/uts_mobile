import 'package:flutter/material.dart';
import '../fragments/biodata_fragment.dart';
import '../fragments/kontak_fragment.dart';
import '../fragments/kalkulator_fragment.dart';
import '../fragments/cuaca_fragment.dart';
import '../fragments/berita_fragment.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  // Daftar Fragment/Halaman [cite: 16]
  static final List<Widget> _widgetOptions = <Widget>[
    const BiodataFragment(),
    const KontakFragment(),
    const KalkulatorFragment(),
    const CuacaFragment(),
    const BeritaFragment(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Menggunakan Bottom Navigation Bar [cite: 15]
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard - ${[
          'Biodata',
          'Kontak',
          'Kalkulator',
          'Cuaca',
          'Berita'
        ][_selectedIndex]}'),
        backgroundColor: Colors.indigo,
      ),
      // Tampilkan Fragment yang dipilih [cite: 16]
      body: _widgetOptions.elementAt(_selectedIndex),
      
      // Implementasi Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Biodata',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Kontak',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Kalkulator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Cuaca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Berita',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Penting jika item lebih dari 3
      ),
    );
  }
}