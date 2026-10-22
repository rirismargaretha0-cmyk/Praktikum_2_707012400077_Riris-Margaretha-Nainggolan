import 'package:flutter/material.dart';

class PengaturanKotaPage extends StatelessWidget {
  const PengaturanKotaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengaturan Kota & Preferensi')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Peringatan Dini Bencana'),
            subtitle: const Text('Kirim notifikasi darurat dari telemetri sensor lingkungan'),
            value: true,
            onChanged: (val) {},
          ),
          SwitchListTile(
            title: const Text('Mode Hemat Bandwidth Kiosk'),
            subtitle: const Text('Kompresi gambar saat koneksi jaringan lobi terbatas'),
            value: false,
            onChanged: (val) {},
          ),
        ],
      ),
    );
  }
}