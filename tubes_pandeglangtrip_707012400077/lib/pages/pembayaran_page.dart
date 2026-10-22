import 'package:flutter/material.dart';

class PembayaranPage extends StatelessWidget {
  final String namaDestinasi;
  final String totalBayar;

  const PembayaranPage({
    super.key,
    required this.namaDestinasi,
    required this.totalBayar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konfirmasi Pembayaran', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF0284C7),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Rincian Pesanan Wisata', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('Destinasi: $namaDestinasi', style: const TextStyle(fontSize: 13)),
                  const SizedBox(height: 4),
                  Text('Total Tagihan: $totalBayar', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF0284C7))),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Metode Pembayaran', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _bangunMetode(Icons.account_balance, 'Transfer Virtual Account (BCA/Mandiri/BRI)', true),
            _bangunMetode(Icons.qr_code, 'QRIS / Dompet Digital', false),
            _bangunMetode(Icons.credit_card, 'Kartu Debit / Kredit', false),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0284C7),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  final pesanSukses = 'Pembayaran $namaDestinasi Berhasil! E-Tiket Anda telah terbit.';
                  Navigator.pop(context, pesanSukses);
                },
                child: const Text('Konfirmasi & Bayar Sekarang', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _bangunMetode(IconData icon, String nama, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFF0F9FF) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isSelected ? const Color(0xFF0284C7) : const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF0284C7), size: 20),
          const SizedBox(width: 12),
          Expanded(child: Text(nama, style: const TextStyle(fontSize: 12.5))),
          if (isSelected) const Icon(Icons.check_circle, color: Color(0xFF0284C7), size: 18),
        ],
      ),
    );
  }
}