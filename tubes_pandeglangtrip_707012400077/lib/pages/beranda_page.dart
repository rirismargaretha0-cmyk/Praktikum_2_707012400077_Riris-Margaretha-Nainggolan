import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> destinasiPopuler = [
      {
        'nama': 'Umang Island Resort',
        'lokasi': 'Sumberjaya, Sumur, Kab. Pandeglang',
        'harga': 'Rp 250.000',
        'rating': '5.0',
        'jam': '07:00 - 18:00 WIB',
        'deskripsi': 'Pulau Umang terkenal dengan keindahan pantainya dan fasilitas resort yang lengkap. Sangat cocok untuk wisata keluarga, snorkeling, dan relaksasi alami di perairan tenang Banten.',
        'warna': const Color(0xFF0284C7),
      },
      {
        'nama': 'Taman Nasional Ujung Kulon',
        'lokasi': 'Kec. Sumur & Cimanggu, Pandeglang',
        'harga': 'Rp 150.000',
        'rating': '4.9',
        'jam': '08:00 - 16:00 WIB',
        'deskripsi': 'Situs warisan dunia UNESCO tempat perlindungan badak bercula satu. Menyajikan keanekaragaman hayati hutan tropis, kano sungai Cigenter, dan keaslian ekosistem alami.',
        'warna': const Color(0xFF059669),
      },
      {
        'nama': 'Pulau Burung (Pulau Dua)',
        'lokasi': 'Kawasan Konservasi Laut Pandeglang',
        'harga': 'Rp 135.000',
        'rating': '4.8',
        'jam': '06:00 - 17:00 WIB',
        'deskripsi': 'Surga pengamatan migrasi burung liar dan keindahan terumbu karang laut lepas dengan pesona pemandangan matahari terbit yang eksotis.',
        'warna': const Color(0xFF0369A1),
      },
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Hero Banner
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              colors: [Color(0xFF0284C7), Color(0xFF0369A1)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dapatkan Kesenangan yang Tak Terlupakan', style: TextStyle(color: Color(0xFFBAE6FD), fontSize: 12)),
              SizedBox(height: 6),
              Text(
                'Jelajahi Keindahan\nkab. Pandeglang',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, height: 1.3),
              ),
              SizedBox(height: 8),
              Text('Pilihan tepat destinasi pulau, alam, dan budaya di ujung barat Jawa.', style: TextStyle(color: Colors.white70, fontSize: 12)),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Text('Destinasi Wisata Populer', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        // Filter Pills
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _bangunPill('Rekomendasi', true),
              _bangunPill('Rating Tertinggi', false),
              _bangunPill('Sering Dikunjungi', false),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Daftar Kartu
        ...destinasiPopuler.map((item) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 130,
                  decoration: BoxDecoration(
                    color: item['warna'],
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  ),
                  child: Center(
                    child: Text(
                      'Preview: ${item['nama']}',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(item['nama'], style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(color: const Color(0xFFFEF9C3), borderRadius: BorderRadius.circular(6)),
                            child: Text('★ ${item['rating']}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF854D0E))),
                          )
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(item['lokasi'], style: const TextStyle(color: Colors.grey, fontSize: 12)),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Mulai ${item['harga']}/org', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0284C7))),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0284C7),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/wisata/detail', arguments: item);
                            },
                            child: const Text('Pesan Tiket', style: TextStyle(color: Colors.white, fontSize: 12)),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _bangunPill(String label, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFFEF08A) : const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isActive ? const Color(0xFFFACC15) : Colors.transparent),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: isActive ? const Color(0xFF854D0E) : const Color(0xFF475569),
        ),
      ),
    );
  }
}