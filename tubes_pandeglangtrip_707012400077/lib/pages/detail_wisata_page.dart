import 'package:flutter/material.dart';

class DetailWisataPage extends StatelessWidget {
  final String namaDestinasi;
  final String lokasi;
  final String harga;
  final String rating;
  final String deskripsi;
  final String jamBuka;

  const DetailWisataPage({
    super.key,
    required this.namaDestinasi,
    required this.lokasi,
    required this.harga,
    required this.rating,
    required this.deskripsi,
    required this.jamBuka,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Destinasi', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF0284C7),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              color: const Color(0xFF0284C7),
              child: Center(
                child: Text(
                  'Foto: $namaDestinasi',
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(namaDestinasi, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      Text('★ $rating', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFFEAB308))),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(lokasi, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F9FF),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFBAE6FD)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.schedule, color: Color(0xFF0284C7), size: 18),
                        const SizedBox(width: 8),
                        Text('Jam Buka: $jamBuka', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF0369A1))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Deskripsi Wisata', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(deskripsi, style: const TextStyle(fontSize: 13.5, height: 1.6, color: Color(0xFF334155))),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -2))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Total Biaya', style: TextStyle(fontSize: 11, color: Colors.grey)),
                Text(harga, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0284C7))),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0284C7),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () async {
                final pesanBalik = await Navigator.pushNamed(
                  context,
                  '/wisata/pembayaran',
                  arguments: {'nama': namaDestinasi, 'harga': harga},
                );

                if (pesanBalik != null && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(pesanBalik.toString()),
                      backgroundColor: const Color(0xFF059669),
                    ),
                  );
                }
              },
              child: const Text('Booking Sekarang', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}