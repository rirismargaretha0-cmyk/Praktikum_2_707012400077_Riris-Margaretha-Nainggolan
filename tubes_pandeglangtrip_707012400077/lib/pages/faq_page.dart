import 'package:flutter/material.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> faqList = [
      {
        'q': '1. Apa saja yang termasuk dalam paket wisata?',
        'a': 'Setiap paket wisata meliputi tiket masuk destinasi, jasa pemandu tur, dan transportasi lokal (kapal/speedboat). Beberapa paket juga termasuk makan siang, dokumentasi, dan perlengkapan khusus seperti alat snorkeling.'
      },
      {
        'q': '2. Bisakah saya memilih atau mengatur sendiri itinerary?',
        'a': 'Bisa, Anda dapat menghubungi tim layanan pelanggan melalui menu Kontak Kami untuk konsultasi paket custom (rombongan keluarga atau gathering perusahaan).'
      },
      {
        'q': '3. Kapan waktu terbaik untuk melakukan pemesanan?',
        'a': 'Disarankan melakukan pemesanan minimal 3 hingga 7 hari sebelum keberangkatan, terutama pada akhir pekan dan musim liburan nasional.'
      },
      {
        'q': '4. Apakah ada biaya tambahan yang harus saya ketahui?',
        'a': 'Harga yang tertera sudah transparan mencakup fasilitas utama. Biaya tambahan hanya berlaku untuk pengeluaran pribadi di luar paket yang dipilih.'
      },
      {
        'q': '5. Bagaimana jika saya ingin membatalkan pesanan?',
        'a': 'Pembatalan pesanan dapat diajukan maksimal 24 jam sebelum jadwal keberangkatan melalui menu Tiket Saya sesuai syarat dan ketentuan pengembalian dana.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ Pertanyaan', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF0284C7),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: faqList.length,
        itemBuilder: (context, index) {
          final item = faqList[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ExpansionTile(
              title: Text(item['q']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5)),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Text(item['a']!, style: const TextStyle(fontSize: 12.5, height: 1.5, color: Color(0xFF475569))),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}