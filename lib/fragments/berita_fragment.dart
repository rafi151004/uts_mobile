import 'package:flutter/material.dart';
import '../models/berita.dart'; // Import Model

class BeritaFragment extends StatelessWidget {
  const BeritaFragment({super.key});

  // Data Berita Statis [cite: 38]
  final List<Berita> staticBerita = const [
    Berita(
      'OpenAI mengumumkan platform untuk membuat ChatGPTs kustom',
      'OpenAI telah mengumumkan platform baru untuk membuat AI kustom...',
      'The Verge',
      '2023/11/06',
      'assets/berita1.jpg',
    ), // Contoh dari soal [cite: 42]
    Berita(
      'Program panda kebun binatang nasional berakhir setelah lebih dari 50 tahun',
      'Tiga panda raksasa telah mengakhiri masa tinggal mereka di...',
      'CNN',
      '2023/11/05',
      'assets/berita2.jpg',
    ), // Contoh dari soal [cite: 43]
    Berita(
      'Elon Musk Luncurkan Roket Baru SpaceX',
      'Uji coba roket Starship berjalan sukses mencapai orbit...',
      'Space Today',
      '2025/10/20',
      'assets/berita3.jpg',
    ),
    Berita(
      'Gubernur Jawa Barat meresmikan Jalan Tol Baru',
      'Akses tol baru ini diharapkan mengurangi kemacetan secara signifikan.',
      'Detik News',
      '2025/10/15',
      'assets/berita4.jpg',
    ),
    Berita(
      'Teknologi AI Terbaru Membantu Diagnosis Penyakit',
      'Sebuah studi baru menunjukkan akurasi tinggi pada alat AI medis.',
      'Healthline',
      '2025/10/10',
      'assets/berita5.jpg',
    ),
    // Tambahkan lebih banyak item statis agar tampilan berulang
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Text(
            'Favourites.', // Sesuai contoh di soal [cite: 40]
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          // Menggunakan ListView.builder untuk tampilan berulang [cite: 38]
          child: ListView.builder(
            itemCount: staticBerita.length,
            itemBuilder: (context, index) {
              final berita = staticBerita[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Gambar Berita (kiri)
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          // Ganti dengan NetworkImage atau AssetImage yang valid
                          image: AssetImage(berita.imagePath),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.grey.shade300,
                      ),
                    ),
                    const SizedBox(width: 15),
                    
                    // Detail Berita (kanan)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            berita.judul,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            berita.deskripsiSingkat,
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                berita.sumber,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Colors.indigo,
                                ),
                              ),
                              Text(
                                berita.tanggal.replaceAll('/', '-'),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}