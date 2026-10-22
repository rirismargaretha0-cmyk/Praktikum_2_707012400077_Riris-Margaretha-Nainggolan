import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Koleksi data terstruktur untuk enam pilar smart city
    final List<Map<String, dynamic>> pilarSmartCity = [
      {'nama': 'Smart Governance', 'icon': Icons.account_balance, 'status': '99.4% Online', 'warna': Colors.blue},
      {'nama': 'Smart Economy', 'icon': Icons.trending_up, 'status': '2.4K Transaksi/hari', 'warna': Colors.green},
      {'nama': 'Smart Living', 'icon': Icons.health_and_safety, 'status': 'Kualitas Udara: Baik', 'warna': Colors.teal},
      {'nama': 'Smart People', 'icon': Icons.school, 'status': '48 Program Literasi', 'warna': Colors.purple},
      {'nama': 'Smart Mobility', 'icon': Icons.directions_bus, 'status': '18 Koridor Terhubung', 'warna': Colors.orange},
      {'nama': 'Smart Environment', 'icon': Icons.eco, 'status': 'Drainase Aman', 'warna': Colors.lightGreen},
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Kartu status operasional infrastruktur kota
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF0D9488), Color(0xFF115E59)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Status Kawasan Kota Nusantara', style: TextStyle(color: Colors.white70, fontSize: 12)),
              SizedBox(height: 4),
              Text('Kondisi Infrastruktur: Normal Optimal', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('Seluruh telemetri sensor lingkungan dan integrasi layanan publik beroperasi tanpa anomali.', style: TextStyle(color: Colors.white70, fontSize: 12)),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text('Ringkasan 6 Pilar Nusantara Cerdas', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        // Grid dua kolom penyaji enam pilar
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.35,
          ),
          itemCount: pilarSmartCity.length,
          itemBuilder: (context, index) {
            final pilar = pilarSmartCity[index];
            return Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(pilar['icon'] as IconData, color: pilar['warna'] as Color, size: 28),
                    const SizedBox(height: 8),
                    Text(pilar['nama'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12.5)),
                    const SizedBox(height: 2),
                    Text(pilar['status'] as String, style: const TextStyle(fontSize: 10.5, color: Colors.grey)),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}


