import 'package:flutter/material.dart';

class TiketPage extends StatelessWidget {
  const TiketPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> tiketList = [
      {'nama': 'Umang Island Resort', 'tgl': '12 Nov 2026', 'jam': '07:00 WIB', 'status': 'AKTIF'},
      {'nama': 'Taman Nasional Ujung Kulon', 'tgl': '28 Okt 2026', 'jam': '08:00 WIB', 'status': 'SELESAI'},
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: tiketList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final t = tiketList[index];
        final bool isAktif = t['status'] == 'AKTIF';
        return Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(t['nama']!, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: isAktif ? const Color(0xFFDCFCE7) : const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(t['status']!, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: isAktif ? Colors.green : Colors.grey)),
                    )
                  ],
                ),
                const SizedBox(height: 6),
                Text('Jadwal Keberangkatan: ${t['tgl']} • ${t['jam']}', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isAktif ? const Color(0xFF0284C7) : Colors.grey.shade400,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  icon: const Icon(Icons.download, size: 16, color: Colors.white),
                  label: const Text('Unduh E-Tiket', style: TextStyle(color: Colors.white, fontSize: 12)),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Mengunduh e-tiket ${t['nama']}...')),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}