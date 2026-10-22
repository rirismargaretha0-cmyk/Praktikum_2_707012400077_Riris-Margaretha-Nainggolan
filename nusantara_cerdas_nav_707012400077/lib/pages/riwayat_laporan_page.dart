import 'package:flutter/material.dart';

class RiwayatLaporanPage extends StatelessWidget {
  const RiwayatLaporanPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data audit trail aduan fasilitas kota
    final List<Map<String, String>> riwayatAduan = [
      {
        'id': 'LAP-2026-089',
        'judul': 'Genangan Saluran Drainase RW 04 Ciumbuleuit',
        'status': 'Diproses Dinas SDA',
        'tanggal': '18 Okt 2026',
        'warna': 'orange',
      },
      {
        'id': 'LAP-2026-064',
        'judul': 'Lampu Penerangan Jalan Umum Mati di Koridor 3',
        'status': 'Tuntas Diperbaiki',
        'tanggal': '12 Okt 2026',
        'warna': 'green',
      },
      {
        'id': 'LAP-2026-041',
        'judul': 'Permintaan Penambahan Tempat Sampah Pilah',
        'status': 'Tuntas Diperbaiki',
        'tanggal': '01 Okt 2026',
        'warna': 'green',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Laporan Warga'), elevation: 0),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: riwayatAduan.length,
        itemBuilder: (context, index) {
          final item = riwayatAduan[index];
          final bool isTuntas = item['warna'] == 'green';
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Icon(
                isTuntas ? Icons.check_circle : Icons.pending_actions,
                color: isTuntas ? Colors.green : Colors.orange,
              ),
              title: Text(
                item['judul']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13.5,
                ),
              ),
              subtitle: Text(
                '${item['id']} • ${item['tanggal']}\nStatus: ${item['status']}',
                style: const TextStyle(fontSize: 12),
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
      // Tombol aksi melayang (FloatingActionButton)
      floatingActionButton: FloatingActionButton(
        elevation: 2,
        backgroundColor: const Color(0xFF0D9488),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Formulir pelaporan baru dibuka.')),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      // Menetapkan letak tombol persis tertanam di tengah takik BottomAppBar
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // Bilah aksi utilitas di bawah
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: Colors.white,
        elevation: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              tooltip: 'Filter Laporan',
              icon: const Icon(Icons.filter_list, color: Color(0xFF0D9488)),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Urutkan Waktu',
              icon: const Icon(Icons.sort, color: Color(0xFF0D9488)),
              onPressed: () {},
            ),
            // Ruang pembatas selebar 48px agar tidak tertutup tombol FAB tengah
            const SizedBox(width: 48),
            IconButton(
              tooltip: 'Cetak Rekap PDF',
              icon: const Icon(Icons.print_outlined, color: Color(0xFF0D9488)),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Sinkronisasi Data',
              icon: const Icon(
                Icons.cloud_sync_outlined,
                color: Color(0xFF0D9488),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
