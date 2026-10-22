import 'package:flutter/material.dart';

class TurPage extends StatelessWidget {
  const TurPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Material(
            color: Colors.white,
            elevation: 1,
            child: const TabBar(
              indicatorColor: Color(0xFF0284C7),
              labelColor: Color(0xFF0284C7),
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: 'Paket Pulau'),
                Tab(text: 'Wisata Alam'),
                Tab(text: 'Tur Edukasi'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                _bangunDaftarTur(context, [
                  {
                    'nama': 'Paket A - Pulau Peucang & Snorkeling',
                    'durasi': '3 Hari 2 Malam',
                    'harga': 'Rp 850.000',
                    'jam': '07:00 - 18:00 WIB',
                    'lokasi': 'Dermaga Sumur, Pandeglang',
                    'rating': '5.0',
                    'deskripsi': 'Eksplorasi perairan Pulau Peucang, snorkeling karang Cidaon, dan menikmati pemandangan alam bebas.',
                  },
                  {
                    'nama': 'Paket B - Safari Ujung Kulon & Kano',
                    'durasi': '2 Hari 1 Malam',
                    'harga': 'Rp 650.000',
                    'jam': '08:00 - 17:00 WIB',
                    'lokasi': 'Taman Nasional Ujung Kulon',
                    'rating': '4.9',
                    'deskripsi': 'Ekspedisi kano menyusuri sungai Cigenter yang tenang, pengamatan satwa, dan bermalam di alam terbuka.',
                  },
                ]),
                _bangunDaftarTur(context, [
                  {
                    'nama': 'Paket C - Eksplor Pantai Carita & Kuliner',
                    'durasi': '1 Hari Penuh',
                    'harga': 'Rp 300.000',
                    'jam': '08:00 - 16:00 WIB',
                    'lokasi': 'Kawasan Wisata Pantai Carita',
                    'rating': '4.8',
                    'deskripsi': 'Menikmati deburan ombak pantai barat Pandeglang disertai sajian makan siang seafood khas Banten.',
                  },
                ]),
                _bangunDaftarTur(context, [
                  {
                    'nama': 'Paket D - Edukasi Konservasi Penyu',
                    'durasi': '1 Hari Penuh',
                    'harga': 'Rp 220.000',
                    'jam': '09:00 - 15:00 WIB',
                    'lokasi': 'Konservasi Penyu Sukarame',
                    'rating': '4.9',
                    'deskripsi': 'Pelepasan tukik penyu ke laut lepas, penanaman terumbu karang, dan lokakarya pelestarian pesisir.',
                  },
                ]),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _bangunDaftarTur(BuildContext context, List<Map<String, dynamic>> turList) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: turList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final tur = turList[index];
        return Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tur['nama'], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Durasi: ${tur['durasi']} • ${tur['jam']}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Harga: ${tur['harga']}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0284C7))),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF0284C7)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/wisata/detail', arguments: tur);
                      },
                      child: const Text('Lihat Rincian', style: TextStyle(color: Color(0xFF0284C7), fontSize: 12)),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}