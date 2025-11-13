import 'package:flutter/material.dart';
import '../models/kontak.dart'; // Import Model

class KontakFragment extends StatelessWidget {
  const KontakFragment({super.key});

  // Data kontak statis (minimal 15 kontak) [cite: 21]
  final List<Kontak> staticKontak = const [
    Kontak('Budi Santoso', '0812-1111-0001', 'assets/p1.jpg'),
    Kontak('Citra Dewi', '0812-1111-0002', 'assets/p2.jpg'),
    Kontak('Didik Prasetyo', '0812-1111-0003', 'assets/p3.jpg'),
    Kontak('Eka Nurhayati', '0812-1111-0004', 'assets/p4.jpg'),
    Kontak('Fajar Hidayat', '0812-1111-0005', 'assets/p5.jpg'),
    Kontak('Gita Permata', '0812-1111-0006', 'assets/p6.jpg'),
    Kontak('Hendra Kusuma', '0812-1111-0007', 'assets/p7.jpg'),
    Kontak('Irma Sari', '0812-1111-0008', 'assets/p8.jpg'),
    Kontak('Joko Susilo', '0812-1111-0009', 'assets/p9.jpg'),
    Kontak('Lina Maulana', '0812-1111-0010', 'assets/p10.jpg'),
    Kontak('Maman Abdurrahman', '0812-1111-0011', 'assets/p11.jpg'),
    Kontak('Nina Kartika', '0812-1111-0012', 'assets/p12.jpg'),
    Kontak('Oky Pratama', '0812-1111-0013', 'assets/p13.jpg'),
    Kontak('Putri Amelia', '0812-1111-0014', 'assets/p14.jpg'),
    Kontak('Roni Setiawan', '0812-1111-0015', 'assets/p15.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    // Menggunakan ListView.builder untuk tampilan berulang [cite: 38]
    return ListView.builder(
      itemCount: staticKontak.length,
      itemBuilder: (context, index) {
        final kontak = staticKontak[index];
        return Card(
          elevation: 0.5,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: ListTile(
            // Circle Image 
            leading: CircleAvatar(
              radius: 28,
              // Ganti dengan NetworkImage atau AssetImage yang valid
              backgroundColor: Colors.indigo.shade100,
              child: Text(
                kontak.nama[0],
                style: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
              ),
              // Tambahkan backgroundImage jika menggunakan aset gambar
              // backgroundImage: AssetImage(kontak.imagePath),
            ),
            title: Text(
              kontak.nama, // Teks Nama 
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              kontak.telepon, // Teks Telepon 
              style: const TextStyle(color: Colors.grey),
            ),
            trailing: const Icon(Icons.call, color: Colors.green),
            onTap: () {
              // Aksi saat item di-tap
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Memanggil ${kontak.nama}...')),
              );
            },
          ),
        );
      },
    );
  }
}