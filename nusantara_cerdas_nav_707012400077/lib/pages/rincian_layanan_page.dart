import 'package:flutter/material.dart';

class RincianLayananPage extends StatelessWidget {
  // Variabel penampung parameter yang diekstrak dari named route
  final String namaLayanan;
  final String dinas;
  final String jamOperasional;
  final String keterangan;

  const RincianLayananPage({
    super.key,
    required this.namaLayanan,
    required this.dinas,
    required this.jamOperasional,
    required this.keterangan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rincian Layanan'), elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kontainer ringkasan parameter layanan
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF0FDFA),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF99F6E4)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    namaLayanan,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF134E4A),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.account_balance_outlined,
                        size: 16,
                        color: Color(0xFF0D9488),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          dinas,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: Color(0xFF0D9488),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        jamOperasional,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Deskripsi & Prosedur Layanan',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              keterangan,
              style: const TextStyle(
                fontSize: 14,
                height: 1.6,
                color: Color(0xFF334155),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Persyaratan Berkas Warga',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const ListTile(
              leading: Icon(Icons.check_circle, color: Color(0xFF0D9488)),
              title: Text(
                'Kartu Tanda Penduduk Digital Nusantara terverifikasi',
              ),
              dense: true,
              contentPadding: EdgeInsets.zero,
            ),
            const ListTile(
              leading: Icon(Icons.check_circle, color: Color(0xFF0D9488)),
              title: Text('Bukti verifikasi domisili kelurahan aktif'),
              dense: true,
              contentPadding: EdgeInsets.zero,
            ),
            const SizedBox(height: 40),
            // Tombol pengajuan yang menutup halaman dan mengembalikan pesan nilai balik
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.send_rounded, color: Colors.white),
                label: const Text(
                  'Ajukan Permohonan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0D9488),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Menutup rute saat ini dan mengembalikan string pesan ke pemanggil
                  final String pesanHasil =
                      'Permohonan "$namaLayanan" berhasil diajukan ke $dinas.';
                  Navigator.pop(context, pesanHasil);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
