import 'package:flutter/material.dart';

class CuacaFragment extends StatelessWidget {
  const CuacaFragment({super.key});

  // Data Cuaca Statis 
  final String lokasi = 'Bandung, Indonesia';
  final String suhu = '28°C';
  final String kondisi = 'Cerah Berawan';
  final String kelembapan = '75%';
  final String kecepatanAngin = '10 km/h';
  final String tekananUdara = '1012 hPa';
  final String iconPath = 'assets/cloud_sun.png'; // Ganti dengan aset gambar yang sesuai

  Widget _buildWeatherDetailCard(String title, String value, IconData icon) {
    return Card(
      elevation: 2,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(icon, color: Colors.indigo, size: 30),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Lokasi
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.indigo),
                const SizedBox(width: 5),
                Text(lokasi, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              ],
            ),
            const SizedBox(height: 30),

            // Suhu Utama & Animasi
            Center(
              child: Column(
                children: [
                  // Gunakan Image atau Lottie untuk gambar animasi yang cakep 
                  // 
                  Image.asset(iconPath, height: 120), 
                  Text(suhu, style: const TextStyle(fontSize: 80, fontWeight: FontWeight.w100)), // Suhu 
                  Text(kondisi, style: const TextStyle(fontSize: 20, color: Colors.indigo)),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Detail Cuaca Lainnya
            const Text('Detail Hari Ini', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Divider(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _buildWeatherDetailCard('Kelembapan', kelembapan, Icons.opacity), // Kelembapan 
                  _buildWeatherDetailCard('Angin', kecepatanAngin, Icons.air),
                  _buildWeatherDetailCard('Tekanan', tekananUdara, Icons.speed),
                  _buildWeatherDetailCard('Index UV', '4', Icons.wb_sunny),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Bagian ini bisa dikembangkan untuk ramalan 5 hari (data statis)
            const Text('Ramalan 5 Hari', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Divider(),
            // Contoh ListTile untuk ramalan harian
            ListTile(
              leading: const Icon(Icons.wb_cloudy, color: Colors.grey),
              title: const Text('Jumat'),
              trailing: const Text('27°/19°C', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Berawan'),
            ),
            // Tambahkan 4 ListTile lainnya
          ],
        ),
      ),
    );
  }
}