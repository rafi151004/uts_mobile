import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 

class BiodataFragment extends StatefulWidget {
  const BiodataFragment({super.key});

  @override
  State<BiodataFragment> createState() => _BiodataFragmentState();
}

class _BiodataFragmentState extends State<BiodataFragment> {
  final String prodi = 'Informatika';
  final String gender = 'Laki-laki';
  final DateTime tglLahir = DateTime(2004, 10, 15); 

  @override
  Widget build(BuildContext context) {
    // Gunakan format DD/MM/YYYY
    String formattedDate = DateFormat('dd/MM/yyyy').format(tglLahir);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // FOTO PROFILE & INFO UTAMA (TIDAK BERUBAH)
          const CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage('assets/profile.jpg'),
            backgroundColor: Colors.indigo,
          ),
          const SizedBox(height: 10),
          const Text('M. Rafi Tajudin', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const Text('Mahasiswa Informatika ITENAS', style: TextStyle(fontSize: 16, color: Colors.grey)),
          const Divider(height: 30),

          // INFORMASI KONTAK (TIDAK BERUBAH)
          const ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            subtitle: Text('m.rafi15@mhs.itenas.ac.id'),
          ),
          const ListTile(
            leading: Icon(Icons.phone),
            title: Text('Telepon'),
            subtitle: Text('085659608199'),
          ),
          
          const Divider(height: 30),

          // 1. PROGRAM STUDI (STATIS)
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Program Studi'),
            subtitle: Text(
              prodi, // Menggunakan data statis 'Informatika'
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          
          // 2. JENIS KELAMIN (STATIS)
          ListTile(
            leading: const Icon(Icons.person_pin),
            title: const Text('Jenis Kelamin'),
            subtitle: Text(
              gender, // Menggunakan data statis 'Laki-laki'
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),

          // 3. TANGGAL LAHIR (STATIS)
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Tanggal Lahir'),
            subtitle: Text(
              formattedDate, // Menggunakan data statis '15/10/2004'
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),

// 4. ALAMAT (Input Dibiarkan sebagai contoh widget input)
          const SizedBox(height: 20),
          TextField(
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Alamat',
              border: OutlineInputBorder(),
              // Hint text sudah tidak terlalu diperlukan karena ada controller
            ),
            readOnly: true, // Jadikan readOnly agar tidak bisa diinput
            // Gunakan TextEditingController untuk mengisi data statis
            controller: TextEditingController(text: "Solokan Jeruk, Bandung, Jawa Barat"), 
          ),
          
          const SizedBox(height: 20),
          const Text(
            'Catatan: Data-data di atas (Kecuali Alamat) kini bersifat statis.',
            style: TextStyle(fontStyle: FontStyle.italic, color: Colors.indigo),
          ),
        ],
      ),
    );
  }
}