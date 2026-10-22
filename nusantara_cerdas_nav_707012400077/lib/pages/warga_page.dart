import 'package:flutter/material.dart';

import '../navigation/app_routes.dart';

class WargaPage extends StatelessWidget {
  const WargaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Profil foto dan identitas warga
          Center(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 46,
                      backgroundColor: const Color(0xFF0D9488),
                      child: const CircleAvatar(
                        radius: 43,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 52,
                          color: Color(0xFF0D9488),
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.green,
                      child: Icon(Icons.check, size: 16, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'Riris Margaretha Nainggolan',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'NIK: 3273-0498-0001-0077 • Warga Terverifikasi',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Kartu statistik ringkas partisipasi warga
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: const Color(0xFFF8FAFC),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _bangunStatistik('14', 'Laporan'),
                  Container(height: 36, width: 1, color: Colors.grey.shade300),
                  _bangunStatistik('12', 'Selesai'),
                  Container(height: 36, width: 1, color: Colors.grey.shade300),
                  _bangunStatistik('98%', 'Skor Warga'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Tombol navigasi untuk membuka riwayat laporan (menambah tumpukan route)
          ListTile(
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            leading: const Icon(Icons.history_edu, color: Color(0xFF0D9488)),
            title: const Text(
              'Riwayat Laporan & Aspirasi',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('Pantau perkembangan aduan fasilitas kota'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.riwayatLaporan);
            },
          ),
        ],
      ),
    );
  }

  Widget _bangunStatistik(String nilai, String label) {
    return Column(
      children: [
        Text(
          nilai,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0D9488),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
